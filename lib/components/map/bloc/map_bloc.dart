import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/shared.dart';

part 'map_bloc.freezed.dart';
part 'map_event.dart';
part 'map_state.dart';

@injectable
class MapBloc extends SafeBloc<MapEvent, MapState> {
  MapBloc(this._cemeteryRepository) : super(const MapState()) {
    on<_LoadMarkers>(_onLoadMarkers);
    on<_SelectCemetery>(_onSelectCemetery);
  }

  final CemeteryRepository _cemeteryRepository;

  Future<void> _onLoadMarkers(
    _LoadMarkers event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));

    final result = await _cemeteryRepository.getCemeteries();
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

  void _onSelectCemetery(
    _SelectCemetery event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(selectedCemetery: event.cemetery));
  }
}
