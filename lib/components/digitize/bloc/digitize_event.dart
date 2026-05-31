part of 'digitize_bloc.dart';

@freezed
sealed class DigitizeEvent with _$DigitizeEvent {
  const factory DigitizeEvent.loadRegions() = _LoadRegions;
  const factory DigitizeEvent.regionChanged(
    Region? region,
  ) = _RegionChanged;
  const factory DigitizeEvent.districtChanged(
    District? district,
  ) = _DistrictChanged;
  const factory DigitizeEvent.settlementChanged(
    Settlement? settlement,
  ) = _SettlementChanged;
  const factory DigitizeEvent.createCemetery({
    required String name,
    required String location,
    required String description,
    required double latitude,
    required double longitude,
    String? photoUrl,
  }) = _CreateCemetery;
  const factory DigitizeEvent.fullNameChanged(
    String value,
  ) = _FullNameChanged;
  const factory DigitizeEvent.birthDateChanged(
    String value,
  ) = _BirthDateChanged;
  const factory DigitizeEvent.deathDateChanged(
    String value,
  ) = _DeathDateChanged;
  const factory DigitizeEvent.bioChanged(
    String value,
  ) = _BioChanged;
  const factory DigitizeEvent.cemeterySelected(
    Cemetery? value,
  ) = _CemeterySelected;
  const factory DigitizeEvent.getCurrentGps() = _GetCurrentGps;
  const factory DigitizeEvent.submitGrave() = _SubmitGrave;
  const factory DigitizeEvent.recognizeTextFromImage(
    String imagePath,
  ) = _RecognizeTextFromImage;
  const factory DigitizeEvent.pickImageAndRecognize() = _PickImageAndRecognize;
  const factory DigitizeEvent.resetForm() = _ResetForm;
}
