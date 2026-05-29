import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'MemoryMap'**
  String get appTitle;

  /// No description provided for @navCemeteries.
  ///
  /// In en, this message translates to:
  /// **'Cemeteries'**
  String get navCemeteries;

  /// No description provided for @navGraves.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navGraves;

  /// No description provided for @navDigitize.
  ///
  /// In en, this message translates to:
  /// **'Digitize'**
  String get navDigitize;

  /// No description provided for @navMap.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get navMap;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @searchCemeteriesHint.
  ///
  /// In en, this message translates to:
  /// **'Search cemeteries...'**
  String get searchCemeteriesHint;

  /// No description provided for @searchGravesHint.
  ///
  /// In en, this message translates to:
  /// **'Search graves by name...'**
  String get searchGravesHint;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get birthDate;

  /// No description provided for @deathDate.
  ///
  /// In en, this message translates to:
  /// **'Death Date'**
  String get deathDate;

  /// No description provided for @gpsCoordinates.
  ///
  /// In en, this message translates to:
  /// **'GPS Coordinates'**
  String get gpsCoordinates;

  /// No description provided for @getGps.
  ///
  /// In en, this message translates to:
  /// **'Get GPS'**
  String get getGps;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @saveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Saved successfully!'**
  String get saveSuccess;

  /// No description provided for @saveError.
  ///
  /// In en, this message translates to:
  /// **'Failed to save: {error}'**
  String saveError(String error);

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @cemetery.
  ///
  /// In en, this message translates to:
  /// **'Cemetery'**
  String get cemetery;

  /// No description provided for @selectCemetery.
  ///
  /// In en, this message translates to:
  /// **'Select Cemetery'**
  String get selectCemetery;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'Biography / Epitaph'**
  String get bio;

  /// No description provided for @addGrave.
  ///
  /// In en, this message translates to:
  /// **'Digitize Grave'**
  String get addGrave;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @invalidDate.
  ///
  /// In en, this message translates to:
  /// **'Invalid date format'**
  String get invalidDate;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @emptyGraves.
  ///
  /// In en, this message translates to:
  /// **'No graves found'**
  String get emptyGraves;

  /// No description provided for @emptyCemeteries.
  ///
  /// In en, this message translates to:
  /// **'No cemeteries found'**
  String get emptyCemeteries;

  /// No description provided for @graveDetails.
  ///
  /// In en, this message translates to:
  /// **'Grave Details'**
  String get graveDetails;

  /// No description provided for @cemeteryDetails.
  ///
  /// In en, this message translates to:
  /// **'Cemetery Details'**
  String get cemeteryDetails;

  /// No description provided for @gpsAquired.
  ///
  /// In en, this message translates to:
  /// **'GPS coordinates acquired'**
  String get gpsAquired;

  /// No description provided for @gpsError.
  ///
  /// In en, this message translates to:
  /// **'Failed to get GPS. Make sure location services are enabled.'**
  String get gpsError;

  /// No description provided for @invalidDateRange.
  ///
  /// In en, this message translates to:
  /// **'Birth date cannot be after death date'**
  String get invalidDateRange;

  /// No description provided for @dateInFuture.
  ///
  /// In en, this message translates to:
  /// **'Date cannot be in the future'**
  String get dateInFuture;

  /// No description provided for @invalidLifespan.
  ///
  /// In en, this message translates to:
  /// **'Age cannot exceed 120 years'**
  String get invalidLifespan;

  /// No description provided for @fullNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Please enter at least first and last name'**
  String get fullNameTooShort;

  /// No description provided for @coordinatesTooFar.
  ///
  /// In en, this message translates to:
  /// **'Coordinates are too far from the selected cemetery'**
  String get coordinatesTooFar;

  /// No description provided for @cemeteryLabel.
  ///
  /// In en, this message translates to:
  /// **'Cemetery'**
  String get cemeteryLabel;

  /// No description provided for @gpsLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location (GPS)'**
  String get gpsLocationLabel;

  /// No description provided for @coordinatesNotDetermined.
  ///
  /// In en, this message translates to:
  /// **'Coordinates not determined'**
  String get coordinatesNotDetermined;

  /// No description provided for @determine.
  ///
  /// In en, this message translates to:
  /// **'Determine'**
  String get determine;

  /// No description provided for @aboutCemetery.
  ///
  /// In en, this message translates to:
  /// **'About Cemetery'**
  String get aboutCemetery;

  /// No description provided for @digitizedGravesCount.
  ///
  /// In en, this message translates to:
  /// **'Digitized graves ({count})'**
  String digitizedGravesCount(int count);

  /// No description provided for @noInformation.
  ///
  /// In en, this message translates to:
  /// **'No information available.'**
  String get noInformation;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get fullNameHint;

  /// No description provided for @bioHint.
  ///
  /// In en, this message translates to:
  /// **'Enter epitaph or biographical details...'**
  String get bioHint;

  /// No description provided for @fillAllRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all required fields'**
  String get fillAllRequiredFields;

  /// No description provided for @dateFormatHint.
  ///
  /// In en, this message translates to:
  /// **'YYYY-MM-DD'**
  String get dateFormatHint;

  /// No description provided for @defaultError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get defaultError;

  /// No description provided for @locationFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get locationFilterAll;

  /// No description provided for @locationFilterGps.
  ///
  /// In en, this message translates to:
  /// **'Near me'**
  String get locationFilterGps;

  /// No description provided for @locationFilterCustom.
  ///
  /// In en, this message translates to:
  /// **'Select on Map'**
  String get locationFilterCustom;

  /// No description provided for @distanceAwayKm.
  ///
  /// In en, this message translates to:
  /// **'{distance} km'**
  String distanceAwayKm(String distance);

  /// No description provided for @distanceAwayM.
  ///
  /// In en, this message translates to:
  /// **'{distance} m'**
  String distanceAwayM(String distance);

  /// No description provided for @selectCustomLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Point on Map'**
  String get selectCustomLocation;

  /// No description provided for @confirmLocation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Location'**
  String get confirmLocation;

  /// No description provided for @mapLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Map ({lat}, {lng})'**
  String mapLocationLabel(String lat, String lng);

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @selectRegion.
  ///
  /// In en, this message translates to:
  /// **'Select region'**
  String get selectRegion;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @selectDistrict.
  ///
  /// In en, this message translates to:
  /// **'Select district'**
  String get selectDistrict;

  /// No description provided for @settlement.
  ///
  /// In en, this message translates to:
  /// **'Settlement'**
  String get settlement;

  /// No description provided for @selectSettlement.
  ///
  /// In en, this message translates to:
  /// **'Select settlement'**
  String get selectSettlement;

  /// No description provided for @addCemetery.
  ///
  /// In en, this message translates to:
  /// **'Add cemetery'**
  String get addCemetery;

  /// No description provided for @cemeteryName.
  ///
  /// In en, this message translates to:
  /// **'Cemetery Name'**
  String get cemeteryName;

  /// No description provided for @cemeteryNameHint.
  ///
  /// In en, this message translates to:
  /// **'Baykove cemetery'**
  String get cemeteryNameHint;

  /// No description provided for @cemeteryDescription.
  ///
  /// In en, this message translates to:
  /// **'Cemetery Description'**
  String get cemeteryDescription;

  /// No description provided for @cemeteryDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Description or history of the cemetery...'**
  String get cemeteryDescriptionHint;

  /// No description provided for @cemeteryCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cemetery created successfully!'**
  String get cemeteryCreatedSuccess;

  /// No description provided for @noCemeteriesInSettlement.
  ///
  /// In en, this message translates to:
  /// **'No digitized cemeteries in this settlement'**
  String get noCemeteriesInSettlement;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @latitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude (Lat)'**
  String get latitude;

  /// No description provided for @longitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude (Lng)'**
  String get longitude;

  /// No description provided for @cemeteryAddressHint.
  ///
  /// In en, this message translates to:
  /// **'6 Baykova St'**
  String get cemeteryAddressHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
