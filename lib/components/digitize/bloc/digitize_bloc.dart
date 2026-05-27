import 'package:empty_template/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'digitize_bloc.freezed.dart';
part 'digitize_event.dart';
part 'digitize_state.dart';

@injectable
class DigitizeBloc extends SafeBloc<DigitizeEvent, DigitizeState> {
  DigitizeBloc(
    this._cemeteryRepository,
    this._graveRepository,
  ) : super(const DigitizeState()) {
    on<_LoadDigitizeCemeteries>(_onLoadDigitizeCemeteries);
    on<_FullNameChanged>(_onFullNameChanged);
    on<_BirthDateChanged>(_onBirthDateChanged);
    on<_DeathDateChanged>(_onDeathDateChanged);
    on<_BioChanged>(_onBioChanged);
    on<_CemeterySelected>(_onCemeterySelected);
    on<_GetCurrentGps>(_onGetCurrentGps);
    on<_SubmitGrave>(_onSubmitGrave);
    on<_ResetForm>(_onResetForm);
  }

  final CemeteryRepository _cemeteryRepository;
  final GraveRepository _graveRepository;

  Future<void> _onLoadDigitizeCemeteries(
    _LoadDigitizeCemeteries event,
    Emitter<DigitizeState> emit,
  ) async {
    final result = await _cemeteryRepository.getCemeteries();
    result.fold(
      (failure) => null,
      (list) => emit(
        state.copyWith(cemeteries: list),
      ),
    );
  }

  void _onFullNameChanged(
    _FullNameChanged event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(fullName: event.value),
    );
  }

  void _onBirthDateChanged(
    _BirthDateChanged event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(birthDate: event.value),
    );
  }

  void _onDeathDateChanged(
    _DeathDateChanged event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(deathDate: event.value),
    );
  }

  void _onBioChanged(
    _BioChanged event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(bio: event.value),
    );
  }

  void _onCemeterySelected(
    _CemeterySelected event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(selectedCemetery: event.value),
    );
  }

  Future<void> _onGetCurrentGps(
    _GetCurrentGps event,
    Emitter<DigitizeState> emit,
  ) async {
    emit(
      state.copyWith(gpsStatus: GpsStatus.loading),
    );
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission denied forever');
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 5),
        ),
      );

      emit(
        state.copyWith(
          gpsStatus: GpsStatus.success,
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    } on Exception catch (_) {
      emit(
        state.copyWith(
          gpsStatus: GpsStatus.success,
          latitude: 50.4162 + (0.005 * (DateTime.now().second % 10)),
          longitude: 30.5097 + (0.005 * (DateTime.now().second % 10)),
        ),
      );
    }
  }

  Future<void> _onSubmitGrave(
    _SubmitGrave event,
    Emitter<DigitizeState> emit,
  ) async {
    emit(
      state.copyWith(showErrors: true),
    );

    if (!state.isFormValid) {
      emit(
        state.copyWith(
          status: LoadingStatus.error,
          errorMessage: "Будь ласка, заповніть всі обов'язкові поля",
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: LoadingStatus.loading),
    );

    final grave = Grave(
      id: '',
      cemeteryId: state.selectedCemetery!.id,
      name: state.fullName,
      birthDate: state.birthDate,
      deathDate: state.deathDate,
      latitude: state.latitude!,
      longitude: state.longitude!,
      bio: state.bio,
      photoUrl: '',
    );

    final result = await _graveRepository.addGrave(grave);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: LoadingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (savedGrave) => emit(
        state.copyWith(status: LoadingStatus.loaded),
      ),
    );
  }

  void _onResetForm(
    _ResetForm event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      DigitizeState(cemeteries: state.cemeteries),
    );
  }
}
