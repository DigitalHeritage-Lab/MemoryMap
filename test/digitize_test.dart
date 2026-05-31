import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';
import 'package:memory_map/components/digitize/ocr/ocr_service.dart';
import 'package:memory_map/shared/shared.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGeolocatorPlatform extends GeolocatorPlatform
    with MockPlatformInterfaceMixin {
  Position? mockPosition;
  LocationPermission mockPermission = LocationPermission.always;

  @override
  Future<LocationPermission> checkPermission() async {
    return mockPermission;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return mockPermission;
  }

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) async {
    return mockPosition ??
        Position(
          latitude: 50.4162,
          longitude: 30.5097,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          altitudeAccuracy: 0,
          heading: 0,
          headingAccuracy: 0,
          speed: 0,
          speedAccuracy: 0,
        );
  }
}

class MockOcrService implements OcrService {
  @override
  Future<OcrResult> processImage(String imagePath) async {
    return OcrResult();
  }

  @override
  Future<void> dispose() async {}
}

class MockCemeteryRepository implements CemeteryRepository {
  List<Cemetery> cemeteriesResult = [];
  Failure? failureResult;

  @override
  Future<Either<Failure, List<Cemetery>>> getCemeteries({
    String? query,
    double? latitude,
    double? longitude,
    String? regionId,
    String? districtId,
    String? settlementId,
  }) async {
    if (failureResult != null) return Left(failureResult!);
    return Right(cemeteriesResult);
  }

  @override
  Future<Either<Failure, Cemetery?>> getCemeteryById(String id) async {
    if (failureResult != null) return Left(failureResult!);
    return Right(cemeteriesResult.firstWhere((c) => c.id == id));
  }

  @override
  Future<Either<Failure, List<Region>>> getRegions() async {
    if (failureResult != null) return Left(failureResult!);
    return const Right([]);
  }

  @override
  Future<Either<Failure, List<District>>> getDistricts(String regionId) async {
    if (failureResult != null) return Left(failureResult!);
    return const Right([]);
  }

  @override
  Future<Either<Failure, List<Settlement>>> getSettlements(
    String districtId,
  ) async {
    if (failureResult != null) return Left(failureResult!);
    return const Right([]);
  }

  @override
  Future<Either<Failure, Cemetery>> addCemetery(Cemetery cemetery) async {
    if (failureResult != null) return Left(failureResult!);
    return Right(cemetery);
  }
}

class MockGraveRepository implements GraveRepository {
  Grave? addedGrave;
  Failure? failureResult;

  @override
  Future<Either<Failure, List<Grave>>> getGraves({
    required int limit,
    required int offset,
    String? query,
    String? cemeteryId,
  }) async {
    return const Right([]);
  }

  @override
  Future<Either<Failure, Grave>> addGrave(Grave grave) async {
    if (failureResult != null) return Left(failureResult!);
    addedGrave = grave;
    return Right(grave);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockCemeteryRepository mockCemeteryRepo;
  late MockGraveRepository mockGraveRepo;
  late MockGeolocatorPlatform mockGeolocator;
  late MockOcrService mockOcrService;

  setUp(() {
    mockCemeteryRepo = MockCemeteryRepository();
    mockGraveRepo = MockGraveRepository();
    mockOcrService = MockOcrService();
    mockGeolocator = MockGeolocatorPlatform();
    GeolocatorPlatform.instance = mockGeolocator;
  });

  group('DigitizeState Validation Tests', () {
    const defaultCemetery = Cemetery(
      id: 'c1',
      name: 'Test Cemetery',
      location: 'Test Location',
      description: '',
      latitude: 50.4501,
      longitude: 30.5234,
      photoUrl: '',
    );

    test('nameError checks', () {
      var state = const DigitizeState();
      expect(state.nameError, 'requiredField');

      state = const DigitizeState(fullName: '  ');
      expect(state.nameError, 'requiredField');

      state = const DigitizeState(fullName: 'Тарас');
      expect(state.nameError, 'fullNameTooShort');

      state = const DigitizeState(fullName: 'Тарас ');
      expect(state.nameError, 'fullNameTooShort');

      state = const DigitizeState(fullName: 'Тарас Шевченко');
      expect(state.nameError, isNull);

      state = const DigitizeState(fullName: ' Тарас   Григорович Шевченко ');
      expect(state.nameError, isNull);
    });

    test('cemeteryError checks', () {
      var state = const DigitizeState();
      expect(state.cemeteryError, 'requiredField');

      state = const DigitizeState(selectedCemetery: defaultCemetery);
      expect(state.cemeteryError, isNull);
    });

    test('birthDateError & deathDateError basic/parsing checks', () {
      var state = const DigitizeState();
      expect(state.birthDateError, 'requiredField');
      expect(state.deathDateError, 'requiredField');

      state = const DigitizeState(
        birthDate: 'invalid-date',
        deathDate: 'invalid-date',
      );
      expect(state.birthDateError, 'invalidDate');
      expect(state.deathDateError, 'invalidDate');

      state = const DigitizeState(
        birthDate: '1990-12-05',
        deathDate: '2020-05-15',
      );
      expect(state.birthDateError, isNull);
      expect(state.deathDateError, isNull);
    });

    test('birthDateError & deathDateError chronological/future/lifespan checks',
        () {
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      final tomorrowStr = '${tomorrow.year}-'
          '${tomorrow.month.toString().padLeft(2, '0')}-'
          '${tomorrow.day.toString().padLeft(2, '0')}';

      // Future date check
      var state = DigitizeState(
        birthDate: tomorrowStr,
        deathDate: '2020-05-15',
      );
      expect(state.birthDateError, 'dateInFuture');

      state = DigitizeState(
        birthDate: '1990-12-05',
        deathDate: tomorrowStr,
      );
      expect(state.deathDateError, 'dateInFuture');

      // Chronological order (birthDate <= deathDate)
      state = const DigitizeState(
        birthDate: '2020-05-15',
        deathDate: '1990-12-05',
      );
      expect(state.birthDateError, 'invalidDateRange');
      expect(state.deathDateError, 'invalidDateRange');

      // Lifespan > 120 years
      state = const DigitizeState(
        birthDate: '1850-01-01',
        deathDate: '1980-01-01',
      );
      expect(state.deathDateError, 'invalidLifespan');

      state = const DigitizeState(
        birthDate: '1900-01-01',
        deathDate: '2020-01-01',
      );
      expect(state.deathDateError, isNull);
    });

    test('gpsError checks', () {
      // Empty coordinates
      var state = const DigitizeState(
        selectedCemetery: defaultCemetery,
      );
      expect(state.gpsError, 'requiredField');

      // Within 3km of cemetery coordinates (cemetery is at 50.4501, 30.5234)
      state = const DigitizeState(
        latitude: 50.4550, // very close
        longitude: 30.5250,
        selectedCemetery: defaultCemetery,
      );
      expect(state.gpsError, isNull);

      // Too far (Kyiv to Lviv coordinates, >3km)
      state = const DigitizeState(
        latitude: 49.8397,
        longitude: 24.0297,
        selectedCemetery: defaultCemetery,
      );
      expect(state.gpsError, 'coordinatesTooFar');
    });

    test('isFormValid matches all fields validation status', () {
      var state = const DigitizeState(
        fullName: 'Тарас Шевченко',
        selectedCemetery: defaultCemetery,
        birthDate: '1990-05-05',
        deathDate: '2020-05-05',
        latitude: 50.4502,
        longitude: 30.5235,
      );
      expect(state.isFormValid, isTrue);

      // Make name invalid
      state = state.copyWith(fullName: 'Тарас');
      expect(state.isFormValid, isFalse);
    });
  });

  group('DigitizeBloc Submission Tests', () {
    test('onSubmitGrave emits error when form is invalid', () async {
      final bloc = DigitizeBloc(mockCemeteryRepo, mockGraveRepo, mockOcrService)
        ..add(const DigitizeEvent.submitGrave());

      await Future<void>.delayed(const Duration(milliseconds: 100));

      expect(bloc.state.showErrors, isTrue);
      expect(bloc.state.status, LoadingStatus.error);
      expect(bloc.state.errorMessage, 'fillAllRequiredFields');
    });

    test('onSubmitGrave saves grave when form is valid', () async {
      // Use close cemetery to pass the 3km verification
      const closeCemetery = Cemetery(
        id: 'c1',
        name: 'Test Cemetery',
        location: 'Test Location',
        description: '',
        latitude: 50.4162,
        longitude: 30.5097,
        photoUrl: '',
      );

      final bloc = DigitizeBloc(mockCemeteryRepo, mockGraveRepo, mockOcrService)
        ..add(const DigitizeEvent.fullNameChanged('Тарас Шевченко'))
        ..add(const DigitizeEvent.birthDateChanged('1990-05-05'))
        ..add(const DigitizeEvent.deathDateChanged('2020-05-05'))
        ..add(const DigitizeEvent.cemeterySelected(closeCemetery))
        ..add(const DigitizeEvent.getCurrentGps());

      await Future<void>.delayed(const Duration(milliseconds: 200));

      expect(bloc.state.latitude, isNotNull);
      expect(bloc.state.longitude, isNotNull);

      bloc.add(const DigitizeEvent.submitGrave());

      await Future<void>.delayed(const Duration(milliseconds: 200));

      expect(bloc.state.status, LoadingStatus.loaded);
      expect(mockGraveRepo.addedGrave, isNotNull);
      expect(mockGraveRepo.addedGrave!.name, 'Тарас Шевченко');
      expect(mockGraveRepo.addedGrave!.birthDate, '1990-05-05');
      expect(mockGraveRepo.addedGrave!.deathDate, '2020-05-05');
    });
  });
}
