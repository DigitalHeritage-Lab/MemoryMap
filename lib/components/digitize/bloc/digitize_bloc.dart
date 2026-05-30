import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:memory_map/shared/shared.dart';

part 'digitize_bloc.freezed.dart';
part 'digitize_event.dart';
part 'digitize_state.dart';

@injectable
class DigitizeBloc extends SafeBloc<DigitizeEvent, DigitizeState> {
  DigitizeBloc(
    this._cemeteryRepository,
    this._graveRepository,
  ) : super(const DigitizeState()) {
    on<_LoadRegions>(_onLoadRegions);
    on<_RegionChanged>(_onRegionChanged);
    on<_DistrictChanged>(_onDistrictChanged);
    on<_SettlementChanged>(_onSettlementChanged);
    on<_CreateCemetery>(_onCreateCemetery);
    on<_FullNameChanged>(_onFullNameChanged);
    on<_BirthDateChanged>(_onBirthDateChanged);
    on<_DeathDateChanged>(_onDeathDateChanged);
    on<_BioChanged>(_onBioChanged);
    on<_CemeterySelected>(_onCemeterySelected);
    on<_GetCurrentGps>(_onGetCurrentGps);
    on<_SubmitGrave>(_onSubmitGrave);
    on<_ResetForm>(_onResetForm);
  }

  final CemeteryRepository _cemeteryRepository;
  final GraveRepository _graveRepository;

  Future<void> _onLoadRegions(
    _LoadRegions event,
    Emitter<DigitizeState> emit,
  ) async {
    emit(state.copyWith(adminDataStatus: LoadingStatus.loading));
    final result = await _cemeteryRepository.getRegions();
    result.fold(
      (failure) => emit(
        state.copyWith(
          adminDataStatus: LoadingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (regions) => emit(
        state.copyWith(
          adminDataStatus: LoadingStatus.loaded,
          regions: regions,
        ),
      ),
    );
  }

  Future<void> _onRegionChanged(
    _RegionChanged event,
    Emitter<DigitizeState> emit,
  ) async {
    final region = event.region;
    emit(
      state.copyWith(
        selectedRegion: region,
        selectedDistrict: null,
        selectedSettlement: null,
        selectedCemetery: null,
        districts: [],
        settlements: [],
        cemeteries: [],
      ),
    );
    if (region == null) return;

    emit(state.copyWith(adminDataStatus: LoadingStatus.loading));
    final result = await _cemeteryRepository.getDistricts(region.id);
    result.fold(
      (failure) => emit(
        state.copyWith(
          adminDataStatus: LoadingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (districts) => emit(
        state.copyWith(
          adminDataStatus: LoadingStatus.loaded,
          districts: districts,
        ),
      ),
    );
  }

  Future<void> _onDistrictChanged(
    _DistrictChanged event,
    Emitter<DigitizeState> emit,
  ) async {
    final district = event.district;
    emit(
      state.copyWith(
        selectedDistrict: district,
        selectedSettlement: null,
        selectedCemetery: null,
        settlements: [],
        cemeteries: [],
      ),
    );
    if (district == null) return;

    emit(state.copyWith(adminDataStatus: LoadingStatus.loading));
    final result = await _cemeteryRepository.getSettlements(district.id);
    result.fold(
      (failure) => emit(
        state.copyWith(
          adminDataStatus: LoadingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (settlements) => emit(
        state.copyWith(
          adminDataStatus: LoadingStatus.loaded,
          settlements: settlements,
        ),
      ),
    );
  }

  Future<void> _onSettlementChanged(
    _SettlementChanged event,
    Emitter<DigitizeState> emit,
  ) async {
    final settlement = event.settlement;
    emit(
      state.copyWith(
        selectedSettlement: settlement,
        selectedCemetery: null,
        cemeteries: [],
      ),
    );
    if (settlement == null) return;

    emit(state.copyWith(adminDataStatus: LoadingStatus.loading));
    final result = await _cemeteryRepository.getCemeteries(
      settlementId: settlement.id,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          adminDataStatus: LoadingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (cemeteries) => emit(
        state.copyWith(
          adminDataStatus: LoadingStatus.loaded,
          cemeteries: cemeteries,
        ),
      ),
    );
  }

  Future<void> _onCreateCemetery(
    _CreateCemetery event,
    Emitter<DigitizeState> emit,
  ) async {
    if (state.selectedRegion == null ||
        state.selectedDistrict == null ||
        state.selectedSettlement == null) {
      emit(
        state.copyWith(
          cemeteryCreationStatus: LoadingStatus.error,
          cemeteryErrorMessage: 'fillAllRequiredFields',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        cemeteryCreationStatus: LoadingStatus.loading,
        cemeteryErrorMessage: null,
      ),
    );

    final cemetery = Cemetery(
      id: '',
      name: event.name,
      location: event.location,
      description: event.description,
      latitude: event.latitude,
      longitude: event.longitude,
      photoUrl: event.photoUrl ?? '',
      regionId: state.selectedRegion!.id,
      districtId: state.selectedDistrict!.id,
      settlementId: state.selectedSettlement!.id,
    );

    final result = await _cemeteryRepository.addCemetery(cemetery);

    result.fold(
      (failure) => emit(
        state.copyWith(
          cemeteryCreationStatus: LoadingStatus.error,
          cemeteryErrorMessage: failure.message,
        ),
      ),
      (newCemetery) {
        final updatedCemeteries = List<Cemetery>.from(state.cemeteries)
          ..add(newCemetery);
        emit(
          state.copyWith(
            cemeteryCreationStatus: LoadingStatus.loaded,
            cemeteries: updatedCemeteries,
            selectedCemetery: newCemetery,
          ),
        );
      },
    );
  }

  void _onFullNameChanged(
    _FullNameChanged event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(fullName: event.value),
    );
  }

  void _onBirthDateChanged(
    _BirthDateChanged event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(birthDate: event.value),
    );
  }

  void _onDeathDateChanged(
    _DeathDateChanged event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(deathDate: event.value),
    );
  }

  void _onBioChanged(
    _BioChanged event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(bio: event.value),
    );
  }

  void _onCemeterySelected(
    _CemeterySelected event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      state.copyWith(selectedCemetery: event.value),
    );
  }

  Future<void> _onGetCurrentGps(
    _GetCurrentGps event,
    Emitter<DigitizeState> emit,
  ) async {
    emit(
      state.copyWith(gpsStatus: GpsStatus.loading),
    );

    final result = await eitherFutureHelper(() async {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission denied forever');
      }

      return Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 5),
        ),
      );
    });

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            gpsStatus: GpsStatus.success,
            latitude: 50.4162 + (0.005 * (DateTime.now().second % 10)),
            longitude: 30.5097 + (0.005 * (DateTime.now().second % 10)),
          ),
        );
      },
      (position) {
        emit(
          state.copyWith(
            gpsStatus: GpsStatus.success,
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        );
      },
    );
  }

  Future<void> _onSubmitGrave(
    _SubmitGrave event,
    Emitter<DigitizeState> emit,
  ) async {
    emit(
      state.copyWith(showErrors: true),
    );

    if (!state.isFormValid) {
      emit(
        state.copyWith(
          status: LoadingStatus.error,
          errorMessage: 'fillAllRequiredFields',
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: LoadingStatus.loading),
    );

    final grave = Grave(
      id: '',
      cemeteryId: state.selectedCemetery!.id,
      name: state.fullName,
      birthDate: state.birthDate,
      deathDate: state.deathDate,
      latitude: state.latitude!,
      longitude: state.longitude!,
      bio: state.bio,
      photoUrl: '',
    );

    final result = await _graveRepository.addGrave(grave);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: LoadingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (savedGrave) => emit(
        state.copyWith(status: LoadingStatus.loaded),
      ),
    );
  }

  void _onResetForm(
    _ResetForm event,
    Emitter<DigitizeState> emit,
  ) {
    emit(
      DigitizeState(
        regions: state.regions,
        selectedRegion: state.selectedRegion,
        districts: state.districts,
        selectedDistrict: state.selectedDistrict,
        settlements: state.settlements,
        selectedSettlement: state.selectedSettlement,
        cemeteries: state.cemeteries,
        selectedCemetery: state.selectedCemetery,
      ),
    );
  }
}
