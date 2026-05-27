part of 'digitize_bloc.dart';

@freezed
sealed class DigitizeEvent with _$DigitizeEvent {
  const factory DigitizeEvent.loadDigitizeCemeteries() =
      _LoadDigitizeCemeteries;
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
    Cemetery value,
  ) = _CemeterySelected;
  const factory DigitizeEvent.getCurrentGps() = _GetCurrentGps;
  const factory DigitizeEvent.submitGrave() = _SubmitGrave;
  const factory DigitizeEvent.resetForm() = _ResetForm;
}
