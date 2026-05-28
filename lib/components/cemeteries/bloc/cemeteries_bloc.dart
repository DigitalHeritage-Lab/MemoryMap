import 'package:empty_template/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'cemeteries_bloc.freezed.dart';
part 'cemeteries_event.dart';
part 'cemeteries_state.dart';

@injectable
class CemeteriesBloc extends SafeBloc<CemeteriesEvent, CemeteriesState> {
  CemeteriesBloc(this._cemeteryRepository) : super(const CemeteriesState()) {
    on<_LoadCemeteries>(
      _onLoadCemeteries,
      transformer: (events, mapper) =>
          events.debounce(const Duration(milliseconds: 300)).switchMap(mapper),
    );
    on<_ChangeLocationMode>(_onChangeLocationMode);
  }

  final CemeteryRepository _cemeteryRepository;

  Future<void> _onChangeLocationMode(
    _ChangeLocationMode event,
    Emitter<CemeteriesState> emit,
  ) async {
    emit(
      state.copyWith(
        locationMode: event.mode,
        gpsError: null,
      ),
    );

    if (event.mode == LocationFilterMode.none) {
      emit(
        state.copyWith(
          userLatitude: null,
          userLongitude: null,
          customLocationName: null,
        ),
      );
      add(const CemeteriesEvent.loadCemeteries());
    } else if (event.mode == LocationFilterMode.custom) {
      emit(
        state.copyWith(
          userLatitude: event.latitude,
          userLongitude: event.longitude,
          customLocationName: event.name,
        ),
      );
      add(const CemeteriesEvent.loadCemeteries());
    } else if (event.mode == LocationFilterMode.gps) {
      await _fetchGpsLocation(emit);
    }
  }

  Future<void> _fetchGpsLocation(Emitter<CemeteriesState> emit) async {
    emit(state.copyWith(status: LoadingStatus.loading, gpsError: null));
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        emit(
          state.copyWith(
            status: LoadingStatus.loaded,
            locationMode: LocationFilterMode.none,
            userLatitude: null,
            userLongitude: null,
            gpsError: 'Доступ до геопозиції заблоковано',
          ),
        );
        add(const CemeteriesEvent.loadCemeteries());
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 5),
        ),
      );

      emit(
        state.copyWith(
          userLatitude: position.latitude,
          userLongitude: position.longitude,
          gpsError: null,
        ),
      );
      add(const CemeteriesEvent.loadCemeteries());
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: LoadingStatus.loaded,
          locationMode: LocationFilterMode.none,
          userLatitude: null,
          userLongitude: null,
          gpsError: 'Не вдалося отримати координати: $e',
        ),
      );
      add(const CemeteriesEvent.loadCemeteries());
    }
  }

  Future<void> _onLoadCemeteries(
    _LoadCemeteries event,
    Emitter<CemeteriesState> emit,
  ) async {
    final searchVal = event.query ?? state.query;
    emit(state.copyWith(status: LoadingStatus.loading, query: searchVal));

    if ((event.refreshLocation ?? false) &&
        state.locationMode == LocationFilterMode.gps) {
      try {
        final position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 5),
          ),
        );
        emit(
          state.copyWith(
            userLatitude: position.latitude,
            userLongitude: position.longitude,
            gpsError: null,
          ),
        );
      } on Exception catch (_) {}
    }

    final result = await _cemeteryRepository.getCemeteries(
      query: searchVal,
      latitude: state.locationMode != LocationFilterMode.none
          ? state.userLatitude
          : null,
      longitude: state.locationMode != LocationFilterMode.none
          ? state.userLongitude
          : null,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: LoadingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (list) => emit(
        state.copyWith(
          status: LoadingStatus.loaded,
          cemeteries: list,
        ),
      ),
    );
  }
}
