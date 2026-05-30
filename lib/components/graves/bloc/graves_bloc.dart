import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/shared.dart';
import 'package:stream_transform/stream_transform.dart';

part 'graves_bloc.freezed.dart';
part 'graves_event.dart';
part 'graves_state.dart';

@injectable
class GravesBloc extends SafeBloc<GravesEvent, GravesState> {
  GravesBloc(this._graveRepository) : super(const GravesState()) {
    on<_LoadGraves>(
      _onLoadGraves,
      transformer: (events, mapper) =>
          events.debounce(const Duration(milliseconds: 300)).switchMap(mapper),
    );
    on<_LoadMoreGraves>(_onLoadMoreGraves);
  }

  final GraveRepository _graveRepository;
  static const int _pageSize = 8;

  Future<void> _onLoadGraves(
    _LoadGraves event,
    Emitter<GravesState> emit,
  ) async {
    final query = event.query ?? '';
    emit(
      state.copyWith(
        status: LoadingStatus.loading,
        query: query,
        graves: [],
        hasReachedMax: false,
      ),
    );

    final result = await _graveRepository.getGraves(
      limit: _pageSize,
      offset: 0,
      query: query,
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
          graves: list,
          hasReachedMax: list.length < _pageSize,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreGraves(
    _LoadMoreGraves event,
    Emitter<GravesState> emit,
  ) async {
    if (state.hasReachedMax ||
        state.status == LoadingStatus.loading ||
        state.isLoadingMore) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));

    final result = await _graveRepository.getGraves(
      limit: _pageSize,
      offset: state.graves.length,
      query: state.query,
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
