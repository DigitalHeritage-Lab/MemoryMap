part of 'cemeteries_bloc.dart';

@freezed
sealed class CemeteriesEvent with _$CemeteriesEvent {
  const factory CemeteriesEvent.loadCemeteries({String? query}) =
      _LoadCemeteries;
}
