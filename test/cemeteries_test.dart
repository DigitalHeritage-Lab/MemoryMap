import 'package:empty_template/components/cemeteries/bloc/cemeteries_bloc.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGeolocatorPlatform extends GeolocatorPlatform
    with MockPlatformInterfaceMixin {
  Position? mockPosition;
  LocationPermission mockPermission = LocationPermission.always;
  bool isServiceEnabled = true;
  String? exceptionMessage;

  @override
  Future<LocationPermission> checkPermission() async {
    return mockPermission;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return mockPermission;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return isServiceEnabled;
  }

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) async {
    if (exceptionMessage != null) {
      throw Exception(exceptionMessage);
    }
    return mockPosition ??
        Position(
          latitude: 50.4501,
          longitude: 30.5234,
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

class MockCemeteryRepository implements CemeteryRepository {
  List<Cemetery> cemeteriesResult = [];
  Failure? failureResult;

  String? lastQuery;
  double? lastLatitude;
  double? lastLongitude;

  @override
  Future<Either<Failure, List<Cemetery>>> getCemeteries({
    String? query,
    double? latitude,
    double? longitude,
  }) async {
    lastQuery = query;
    lastLatitude = latitude;
    lastLongitude = longitude;

    if (failureResult != null) {
      return Left(failureResult!);
    }
    return Right(cemeteriesResult);
  }

  @override
  Future<Either<Failure, Cemetery?>> getCemeteryById(String id) async {
    if (failureResult != null) {
      return Left(failureResult!);
    }
    return Right(cemeteriesResult.firstWhere((c) => c.id == id));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockCemeteryRepository mockRepository;
  late MockGeolocatorPlatform mockGeolocator;

  setUp(() {
    mockRepository = MockCemeteryRepository();
    mockGeolocator = MockGeolocatorPlatform();
    GeolocatorPlatform.instance = mockGeolocator;
  });

  group('Cemetery Model Tests', () {
    test('fromJson & toJson correctly parse distanceKm', () {
      final json = {
        'id': '123',
        'name': 'Test Cemetery',
        'location': 'Kyiv',
        'description': 'Desc',
        'latitude': 50.45,
        'longitude': 30.52,
        'photo_url': 'http://image.jpg',
        'distance_km': 12.34,
      };

      final cemetery = Cemetery.fromJson(json);
      expect(cemetery.distanceKm, 12.34);
      expect(cemetery.toJson()['distance_km'], 12.34);
    });

    test('fromJson & toJson handle null distanceKm', () {
      final json = {
        'id': '123',
        'name': 'Test Cemetery',
        'location': 'Kyiv',
        'description': 'Desc',
        'latitude': 50.45,
        'longitude': 30.52,
        'photo_url': 'http://image.jpg',
      };

      final cemetery = Cemetery.fromJson(json);
      expect(cemetery.distanceKm, isNull);
      expect(cemetery.toJson()['distance_km'], isNull);
    });
  });

  group('CemeteriesBloc Tests', () {
    test('initial state is correct', () {
      final bloc = CemeteriesBloc(mockRepository);
      expect(bloc.state.status, LoadingStatus.initial);
      expect(bloc.state.locationMode, LocationFilterMode.none);
      expect(bloc.state.userLatitude, isNull);
      expect(bloc.state.userLongitude, isNull);
    });

    test('loadCemeteries loads from repository', () async {
      final bloc = CemeteriesBloc(mockRepository);
      mockRepository.cemeteriesResult = [
        const Cemetery(
          id: '1',
          name: 'Cemetery 1',
          location: 'Loc',
          description: 'Desc',
          latitude: 50,
          longitude: 30,
          photoUrl: '',
        ),
      ];

      bloc.add(const CemeteriesEvent.loadCemeteries(query: 'test'));

      await Future<void>.delayed(const Duration(milliseconds: 400));

      expect(bloc.state.status, LoadingStatus.loaded);
      expect(bloc.state.query, 'test');
      expect(bloc.state.cemeteries, mockRepository.cemeteriesResult);

      expect(mockRepository.lastQuery, 'test');
      expect(mockRepository.lastLatitude, isNull);
      expect(mockRepository.lastLongitude, isNull);
    });

    test('changeLocationMode to custom updates state and reloads', () async {
      final bloc = CemeteriesBloc(mockRepository);
      mockRepository.cemeteriesResult = [
        const Cemetery(
          id: '1',
          name: 'Cemetery 1',
          location: 'Loc',
          description: 'Desc',
          latitude: 50,
          longitude: 30,
          photoUrl: '',
          distanceKm: 5.5,
        ),
      ];

      bloc.add(
        const CemeteriesEvent.changeLocationMode(
          LocationFilterMode.custom,
          latitude: 50.1,
          longitude: 30.1,
          name: 'Custom Point',
        ),
      );

      await Future<void>.delayed(const Duration(milliseconds: 400));

      expect(bloc.state.status, LoadingStatus.loaded);
      expect(bloc.state.locationMode, LocationFilterMode.custom);
      expect(bloc.state.userLatitude, 50.1);
      expect(bloc.state.userLongitude, 30.1);
      expect(bloc.state.customLocationName, 'Custom Point');
      expect(bloc.state.cemeteries, mockRepository.cemeteriesResult);

      expect(mockRepository.lastLatitude, 50.1);
      expect(mockRepository.lastLongitude, 30.1);
    });

    test('changeLocationMode to gps requests permission and fetches location',
        () async {
      final bloc = CemeteriesBloc(mockRepository);
      mockGeolocator.mockPosition = Position(
        latitude: 50.4501,
        longitude: 30.5234,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );

      bloc.add(
        const CemeteriesEvent.changeLocationMode(
          LocationFilterMode.gps,
        ),
      );

      await Future<void>.delayed(const Duration(milliseconds: 400));

      expect(bloc.state.status, LoadingStatus.loaded);
      expect(bloc.state.locationMode, LocationFilterMode.gps);
      expect(bloc.state.userLatitude, 50.4501);
      expect(bloc.state.userLongitude, 30.5234);

      expect(mockRepository.lastLatitude, 50.4501);
      expect(mockRepository.lastLongitude, 30.5234);
    });

    test('changeLocationMode to gps handles permission failure gracefully',
        () async {
      final bloc = CemeteriesBloc(mockRepository);
      mockGeolocator.mockPermission = LocationPermission.denied;

      bloc.add(
        const CemeteriesEvent.changeLocationMode(
          LocationFilterMode.gps,
        ),
      );

      await Future<void>.delayed(const Duration(milliseconds: 400));

      expect(bloc.state.status, LoadingStatus.loaded);
      expect(bloc.state.locationMode, LocationFilterMode.none);
      expect(bloc.state.gpsError, 'Доступ до геопозиції заблоковано');
      expect(bloc.state.userLatitude, isNull);
      expect(bloc.state.userLongitude, isNull);

      expect(mockRepository.lastLatitude, isNull);
      expect(mockRepository.lastLongitude, isNull);
    });
  });
}
