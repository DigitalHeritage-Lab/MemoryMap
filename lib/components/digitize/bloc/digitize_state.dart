part of 'digitize_bloc.dart';

enum GpsStatus { idle, loading, success, error }

@freezed
sealed class DigitizeState with _$DigitizeState {
  const factory DigitizeState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(LoadingStatus.initial) LoadingStatus adminDataStatus,
    @Default(LoadingStatus.initial) LoadingStatus cemeteryCreationStatus,
    @Default([]) List<Region> regions,
    @Default([]) List<District> districts,
    @Default([]) List<Settlement> settlements,
    @Default([]) List<Cemetery> cemeteries,
    Region? selectedRegion,
    District? selectedDistrict,
    Settlement? selectedSettlement,
    @Default(GpsStatus.idle) GpsStatus gpsStatus,
    @Default('') String fullName,
    @Default('') String birthDate,
    @Default('') String deathDate,
    @Default('') String bio,
    Cemetery? selectedCemetery,
    double? latitude,
    double? longitude,
    @Default(false) bool showErrors,
    String? errorMessage,
    String? cemeteryErrorMessage,
  }) = _DigitizeState;

  const DigitizeState._();

  bool get isFormValid {
    return nameError == null &&
        cemeteryError == null &&
        birthDateError == null &&
        deathDateError == null &&
        gpsError == null;
  }

  String? get nameError {
    final trimmed = fullName.trim();
    if (trimmed.isEmpty) return 'requiredField';
    final words =
        trimmed.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    if (words.length < 2) return 'fullNameTooShort';
    return null;
  }

  String? get cemeteryError {
    return selectedCemetery == null ? 'requiredField' : null;
  }

  String? get birthDateError {
    final trimmed = birthDate.trim();
    if (trimmed.isEmpty) return 'requiredField';
    final parsed = DateTime.tryParse(trimmed);
    if (parsed == null) return 'invalidDate';

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (parsed.isAfter(today)) return 'dateInFuture';

    final deathTrimmed = deathDate.trim();
    if (deathTrimmed.isNotEmpty) {
      final deathParsed = DateTime.tryParse(deathTrimmed);
      if (deathParsed != null && parsed.isAfter(deathParsed)) {
        return 'invalidDateRange';
      }
    }
    return null;
  }

  String? get deathDateError {
    final trimmed = deathDate.trim();
    if (trimmed.isEmpty) return 'requiredField';
    final parsed = DateTime.tryParse(trimmed);
    if (parsed == null) return 'invalidDate';

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (parsed.isAfter(today)) return 'dateInFuture';

    final birthTrimmed = birthDate.trim();
    if (birthTrimmed.isNotEmpty) {
      final birthParsed = DateTime.tryParse(birthTrimmed);
      if (birthParsed != null) {
        if (birthParsed.isAfter(parsed)) {
          return 'invalidDateRange';
        }
        // Age calculation
        var age = parsed.year - birthParsed.year;
        if (parsed.month < birthParsed.month ||
            (parsed.month == birthParsed.month &&
                parsed.day < birthParsed.day)) {
          age--;
        }
        if (age > 120) return 'invalidLifespan';
      }
    }
    return null;
  }

  String? get gpsError {
    if (latitude == null || longitude == null) return 'requiredField';
    if (selectedCemetery == null) return null;

    final distance = const Distance().as(
      LengthUnit.Meter,
      LatLng(latitude!, longitude!),
      LatLng(selectedCemetery!.latitude, selectedCemetery!.longitude),
    );

    if (distance > 3000) return 'coordinatesTooFar';
    return null;
  }
}
