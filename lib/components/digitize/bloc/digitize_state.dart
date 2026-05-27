part of 'digitize_bloc.dart';

enum GpsStatus { idle, loading, success, error }

@freezed
sealed class DigitizeState with _$DigitizeState {
  const factory DigitizeState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(GpsStatus.idle) GpsStatus gpsStatus,
    @Default([]) List<Cemetery> cemeteries,
    @Default('') String fullName,
    @Default('') String birthDate,
    @Default('') String deathDate,
    @Default('') String bio,
    Cemetery? selectedCemetery,
    double? latitude,
    double? longitude,
    @Default(false) bool showErrors,
    String? errorMessage,
  }) = _DigitizeState;

  const DigitizeState._();

  bool get isFormValid {
    return fullName.trim().isNotEmpty &&
        selectedCemetery != null &&
        latitude != null &&
        longitude != null &&
        birthDate.trim().isNotEmpty &&
        deathDate.trim().isNotEmpty;
  }
}
