part of 'cemetery_detail_bloc.dart';

@freezed
sealed class CemeteryDetailEvent with _$CemeteryDetailEvent {
  const factory CemeteryDetailEvent.loadCemeteryDetail(
    String id,
  ) = _LoadCemeteryDetail;

  const factory CemeteryDetailEvent.loadMoreGraves() = _LoadMoreGraves;
}
