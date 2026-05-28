import 'package:empty_template/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
  }

  final CemeteryRepository _cemeteryRepository;

  Future<void> _onLoadCemeteries(
    _LoadCemeteries event,
    Emitter<CemeteriesState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));

    final result = await _cemeteryRepository.getCemeteries(query: event.query);
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
