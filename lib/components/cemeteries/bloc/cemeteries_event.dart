part of 'cemeteries_bloc.dart';

@freezed
sealed class CemeteriesEvent with _$CemeteriesEvent {
  const factory CemeteriesEvent.loadCemeteries({
    String? query,
    bool? refreshLocation,
  }) = _LoadCemeteries;

  const factory CemeteriesEvent.changeLocationMode(
    LocationFilterMode mode, {
    double? latitude,
    double? longitude,
    String? name,
  }) = _ChangeLocationMode;
}
