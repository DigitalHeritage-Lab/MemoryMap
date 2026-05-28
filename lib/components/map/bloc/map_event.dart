part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.loadMarkers() = _LoadMarkers;
  const factory MapEvent.selectCemetery(Cemetery? cemetery) = _SelectCemetery;
}
