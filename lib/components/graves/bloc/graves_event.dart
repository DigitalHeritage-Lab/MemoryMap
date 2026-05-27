part of 'graves_bloc.dart';

@freezed
sealed class GravesEvent with _$GravesEvent {
  const factory GravesEvent.loadGraves({String? query}) = _LoadGraves;
  const factory GravesEvent.loadMoreGraves() = _LoadMoreGraves;
}
