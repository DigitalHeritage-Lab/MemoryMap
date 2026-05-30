import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/shared.dart';

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
    on<_LoadMoreGraves>(_onLoadMoreGraves);
  }

  final CemeteryRepository _cemeteryRepository;
  final GraveRepository _graveRepository;
  static const int _pageSize = 10;

  Future<void> _onLoadCemeteryDetail(
    _LoadCemeteryDetail event,
    Emitter<CemeteryDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LoadingStatus.loading,
        cemetery: null,
        graves: [],
        hasReachedMax: false,
        isLoadingMore: false,
      ),
    );

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
          limit: _pageSize,
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
              hasReachedMax: graves.length < _pageSize,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreGraves(
    _LoadMoreGraves event,
    Emitter<CemeteryDetailState> emit,
  ) async {
    if (state.hasReachedMax ||
        state.status == LoadingStatus.loading ||
        state.isLoadingMore ||
        state.cemetery == null) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));

    final result = await _graveRepository.getGraves(
      limit: _pageSize,
      offset: state.graves.length,
      cemeteryId: state.cemetery!.id,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingMore: false,
          status: LoadingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (list) => emit(
        state.copyWith(
          status: LoadingStatus.loaded,
          isLoadingMore: false,
          graves: [...state.graves, ...list],
          hasReachedMax: list.length < _pageSize,
        ),
      ),
    );
  }
}
