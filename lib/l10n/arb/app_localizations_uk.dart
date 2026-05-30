// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Карта Пам\'яті';

  @override
  String get navCemeteries => 'Цвинтарі';

  @override
  String get navGraves => 'Пошук';

  @override
  String get navDigitize => 'Оцифрувати';

  @override
  String get navMap => 'Карта';

  @override
  String get navProfile => 'Профіль';

  @override
  String get details => 'Детальніше';

  @override
  String get searchCemeteriesHint => 'Пошук цвинтарів...';

  @override
  String get searchGravesHint => 'Пошук могил за ПІБ...';

  @override
  String get birthDate => 'Дата народження';

  @override
  String get deathDate => 'Дата смерті';

  @override
  String get gpsCoordinates => 'GPS координати';

  @override
  String get getGps => 'Отримати GPS';

  @override
  String get save => 'Зберегти';

  @override
  String get saving => 'Збереження...';

  @override
  String get saveSuccess => 'Успішно збережено!';

  @override
  String saveError(String error) {
    return 'Помилка збереження: $error';
  }

  @override
  String get fullName => 'ПІБ покійного';

  @override
  String get cemetery => 'Цвинтар';

  @override
  String get selectCemetery => 'Виберіть цвинтар';

  @override
  String get bio => 'Біографія / Епітафія';

  @override
  String get addGrave => 'Оцифрувати могилу';

  @override
  String get requiredField => 'Це поле є обов\'язковим';

  @override
  String get invalidDate => 'Некоректний формат дати';

  @override
  String get tryAgain => 'Спробувати знову';

  @override
  String get loading => 'Завантаження...';

  @override
  String get emptyGraves => 'Могил не знайдено';

  @override
  String get emptyCemeteries => 'Цвинтарів не знайдено';

  @override
  String get graveDetails => 'Деталі поховання';

  @override
  String get cemeteryDetails => 'Деталі цвинтаря';

  @override
  String get gpsAquired => 'GPS координати отримано';

  @override
  String get gpsError =>
      'Не вдалося отримати GPS. Перевірте дозволи геопозиції.';

  @override
  String get invalidDateRange =>
      'Дата народження не може бути пізнішою за дату смерті';

  @override
  String get dateInFuture => 'Дата не може бути в майбутньому';

  @override
  String get invalidLifespan => 'Вік не може перевищувати 120 років';

  @override
  String get fullNameTooShort =>
      'Будь ласка, введіть щонайменше ім\'я та прізвище';

  @override
  String get coordinatesTooFar =>
      'Координати знаходяться занадто далеко від вибраного цвинтаря';

  @override
  String get duplicateGrave =>
      'Ця фотографія або могила вже була додана раніше';

  @override
  String get cemeteryLabel => 'Цвинтар';

  @override
  String get gpsLocationLabel => 'Місцезнаходження (GPS)';

  @override
  String get coordinatesNotDetermined => 'Координати не визначено';

  @override
  String get determine => 'Визначити';

  @override
  String get aboutCemetery => 'Про цвинтар';

  @override
  String digitizedGravesCount(int count) {
    return 'Оцифровані поховання ($count)';
  }

  @override
  String get noInformation => 'Інформація відсутня.';

  @override
  String get fullNameHint => 'Шевченко Тарас Григорович';

  @override
  String get bioHint => 'Введіть епітафію чи біографічні відомості...';

  @override
  String get fillAllRequiredFields =>
      'Будь ласка, заповніть всі обов\'язкові поля';

  @override
  String get dateFormatHint => 'РРРР-ММ-ДД';

  @override
  String get defaultError => 'Щось пішло не так. Будь ласка, спробуйте ще раз.';

  @override
  String get locationFilterAll => 'Усі';

  @override
  String get locationFilterGps => 'Поблизу мене';

  @override
  String get locationFilterCustom => 'Вибрати на карті';

  @override
  String distanceAwayKm(String distance) {
    return '$distance км';
  }

  @override
  String distanceAwayM(String distance) {
    return '$distance м';
  }

  @override
  String get selectCustomLocation => 'Вибір точки на карті';

  @override
  String get confirmLocation => 'Підтвердити локацію';

  @override
  String mapLocationLabel(String lat, String lng) {
    return 'Мапа ($lat, $lng)';
  }

  @override
  String get region => 'Область';

  @override
  String get selectRegion => 'Виберіть область';

  @override
  String get district => 'Район';

  @override
  String get selectDistrict => 'Виберіть район';

  @override
  String get settlement => 'Населений пункт';

  @override
  String get selectSettlement => 'Виберіть населений пункт';

  @override
  String get addCemetery => 'Додати цвинтар';

  @override
  String get cemeteryName => 'Назва цвинтаря';

  @override
  String get cemeteryNameHint => 'Байкове кладовище';

  @override
  String get cemeteryDescription => 'Опис цвинтаря';

  @override
  String get cemeteryDescriptionHint => 'Опис або історія цвинтаря...';

  @override
  String get cemeteryCreatedSuccess => 'Цвинтар успішно створено!';

  @override
  String get noCemeteriesInSettlement =>
      'У цьому населеному пункті немає оцифрованих цвинтарів';

  @override
  String get cancel => 'Скасувати';

  @override
  String get latitude => 'Широта (Lat)';

  @override
  String get longitude => 'Довгота (Lng)';

  @override
  String get cemeteryAddressHint => 'вул. Байкова, 6';

  @override
  String get inDevelopment => 'В розробці...';

  @override
  String yearsOld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count років',
      many: '$count років',
      few: '$count роки',
      one: '$count рік',
    );
    return '$_temp0';
  }
}
