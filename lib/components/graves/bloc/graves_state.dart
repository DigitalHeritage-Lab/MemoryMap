part of 'graves_bloc.dart';

@freezed
sealed class GravesState with _$GravesState {
  const factory GravesState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<Grave> graves,
    @Default(false) bool hasReachedMax,
    @Default('') String query,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
  }) = _GravesState;
}
