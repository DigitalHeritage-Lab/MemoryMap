part of 'map_bloc.dart';

@freezed
sealed class MapState with _$MapState {
  const factory MapState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<Cemetery> cemeteries,
    Cemetery? selectedCemetery,
    String? errorMessage,
  }) = _MapState;
}
