// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'MemoryMap';

  @override
  String get navCemeteries => 'Cemeteries';

  @override
  String get navGraves => 'Search';

  @override
  String get navDigitize => 'Digitize';

  @override
  String get navMap => 'Map';

  @override
  String get searchCemeteriesHint => 'Search cemeteries...';

  @override
  String get searchGravesHint => 'Search graves by name...';

  @override
  String get birthDate => 'Birth Date';

  @override
  String get deathDate => 'Death Date';

  @override
  String get gpsCoordinates => 'GPS Coordinates';

  @override
  String get getGps => 'Get GPS';

  @override
  String get save => 'Save';

  @override
  String get saving => 'Saving...';

  @override
  String get saveSuccess => 'Saved successfully!';

  @override
  String saveError(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get fullName => 'Full Name';

  @override
  String get cemetery => 'Cemetery';

  @override
  String get selectCemetery => 'Select Cemetery';

  @override
  String get bio => 'Biography / Epitaph';

  @override
  String get addGrave => 'Digitize Grave';

  @override
  String get requiredField => 'This field is required';

  @override
  String get invalidDate => 'Invalid date format';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get loading => 'Loading...';

  @override
  String get emptyGraves => 'No graves found';

  @override
  String get emptyCemeteries => 'No cemeteries found';

  @override
  String get graveDetails => 'Grave Details';

  @override
  String get cemeteryDetails => 'Cemetery Details';

  @override
  String get gpsAquired => 'GPS coordinates acquired';

  @override
  String get gpsError =>
      'Failed to get GPS. Make sure location services are enabled.';

  @override
  String get cemeteryLabel => 'Cemetery';

  @override
  String get gpsLocationLabel => 'Location (GPS)';

  @override
  String get coordinatesNotDetermined => 'Coordinates not determined';

  @override
  String get determine => 'Determine';

  @override
  String get aboutCemetery => 'About Cemetery';

  @override
  String digitizedGravesCount(int count) {
    return 'Digitized graves ($count)';
  }

  @override
  String get noInformation => 'No information available.';

  @override
  String get fullNameHint => 'John Doe';

  @override
  String get bioHint => 'Enter epitaph or biographical details...';

  @override
  String get fillAllRequiredFields => 'Please fill in all required fields';

  @override
  String get dateFormatHint => 'YYYY-MM-DD';

  @override
  String get defaultError => 'Something went wrong. Please try again.';
}
