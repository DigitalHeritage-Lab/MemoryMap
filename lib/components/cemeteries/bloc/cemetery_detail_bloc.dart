import 'package:empty_template/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cemetery_detail_bloc.freezed.dart';
part 'cemetery_detail_event.dart';
part 'cemetery_detail_state.dart';

@injectable
class CemeteryDetailBloc
    extends SafeBloc<CemeteryDetailEvent, CemeteryDetailState> {
  CemeteryDetailBloc(
    this._cemeteryRepository,
    this._graveRepository,
  ) : super(const CemeteryDetailState()) {
    on<_LoadCemeteryDetail>(_onLoadCemeteryDetail);
  }

  final CemeteryRepository _cemeteryRepository;
  final GraveRepository _graveRepository;

  Future<void> _onLoadCemeteryDetail(
    _LoadCemeteryDetail event,
    Emitter<CemeteryDetailState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));

    final cemeteryResult = await _cemeteryRepository.getCemeteryById(event.id);

    await cemeteryResult.fold(
      (failure) async {
        emit(
          state.copyWith(
            status: LoadingStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (cemetery) async {
        if (cemetery == null) {
          emit(
            state.copyWith(
              status: LoadingStatus.error,
              errorMessage: 'Цвинтар не знайдено',
            ),
          );
          return;
        }

        final gravesResult = await _graveRepository.getGraves(
          limit: 50,
          offset: 0,
          cemeteryId: event.id,
        );

        gravesResult.fold(
          (failure) => emit(
            state.copyWith(
              status: LoadingStatus.error,
              errorMessage: failure.message,
            ),
          ),
          (graves) => emit(
            state.copyWith(
              status: LoadingStatus.loaded,
              cemetery: cemetery,
              graves: graves,
            ),
          ),
        );
      },
    );
  }
}
