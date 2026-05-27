part of 'cemeteries_bloc.dart';

@freezed
sealed class CemeteriesState with _$CemeteriesState {
  const factory CemeteriesState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<Cemetery> cemeteries,
    String? errorMessage,
  }) = _CemeteriesState;
}
