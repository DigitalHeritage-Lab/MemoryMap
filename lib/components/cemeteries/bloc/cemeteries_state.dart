part of 'cemeteries_bloc.dart';

enum LocationFilterMode { none, gps, custom }

@freezed
sealed class CemeteriesState with _$CemeteriesState {
  const factory CemeteriesState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<Cemetery> cemeteries,
    String? errorMessage,
    @Default('') String query,
    @Default(LocationFilterMode.none) LocationFilterMode locationMode,
    double? userLatitude,
    double? userLongitude,
    String? customLocationName,
    String? gpsError,
  }) = _CemeteriesState;
}
