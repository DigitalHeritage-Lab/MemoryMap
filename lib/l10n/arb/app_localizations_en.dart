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
  String get navProfile => 'Profile';

  @override
  String get details => 'Details';

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
  String get invalidDateRange => 'Birth date cannot be after death date';

  @override
  String get dateInFuture => 'Date cannot be in the future';

  @override
  String get invalidLifespan => 'Age cannot exceed 120 years';

  @override
  String get fullNameTooShort => 'Please enter at least first and last name';

  @override
  String get coordinatesTooFar =>
      'Coordinates are too far from the selected cemetery';

  @override
  String get duplicateGrave =>
      'It looks like this grave has already been added. Thank you for your contribution!';

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

  @override
  String get locationFilterAll => 'All';

  @override
  String get locationFilterGps => 'Near me';

  @override
  String get locationFilterCustom => 'Select on Map';

  @override
  String distanceAwayKm(String distance) {
    return '$distance km';
  }

  @override
  String distanceAwayM(String distance) {
    return '$distance m';
  }

  @override
  String get selectCustomLocation => 'Select Point on Map';

  @override
  String get confirmLocation => 'Confirm Location';

  @override
  String mapLocationLabel(String lat, String lng) {
    return 'Map ($lat, $lng)';
  }

  @override
  String get region => 'Region';

  @override
  String get selectRegion => 'Select region';

  @override
  String get district => 'District';

  @override
  String get selectDistrict => 'Select district';

  @override
  String get settlement => 'Settlement';

  @override
  String get selectSettlement => 'Select settlement';

  @override
  String get addCemetery => 'Add cemetery';

  @override
  String get cemeteryName => 'Cemetery Name';

  @override
  String get cemeteryNameHint => 'Baykove cemetery';

  @override
  String get cemeteryDescription => 'Cemetery Description';

  @override
  String get cemeteryDescriptionHint =>
      'Description or history of the cemetery...';

  @override
  String get cemeteryCreatedSuccess => 'Cemetery created successfully!';

  @override
  String get noCemeteriesInSettlement =>
      'No digitized cemeteries in this settlement';

  @override
  String get cancel => 'Cancel';

  @override
  String get latitude => 'Latitude (Lat)';

  @override
  String get longitude => 'Longitude (Lng)';

  @override
  String get cemeteryAddressHint => '6 Baykova St';

  @override
  String get inDevelopment => 'In development...';

  @override
  String get scanTextOcr => 'Scan text (OCR)';

  @override
  String yearsOld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years',
      one: '$count year',
    );
    return '$_temp0';
  }
}
