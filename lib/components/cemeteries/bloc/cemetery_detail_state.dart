part of 'cemetery_detail_bloc.dart';

@freezed
sealed class CemeteryDetailState with _$CemeteryDetailState {
  const factory CemeteryDetailState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    Cemetery? cemetery,
    @Default([]) List<Grave> graves,
    String? errorMessage,
  }) = _CemeteryDetailState;
}
