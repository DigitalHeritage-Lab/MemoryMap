import 'package:equatable/equatable.dart';
import 'package:memory_map/shared/shared.dart';

class CameraState extends Equatable {
  const CameraState({
    this.status = LoadingStatus.initial,
    this.imagePath,
    this.failure,
  });

  final LoadingStatus status;
  final String? imagePath;
  final Failure? failure;

  CameraState copyWith({
    LoadingStatus? status,
    String? imagePath,
    Failure? failure,
    bool clearImagePath = false,
    bool clearFailure = false,
  }) {
    return CameraState(
      status: status ?? this.status,
      imagePath: clearImagePath ? null : (imagePath ?? this.imagePath),
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [status, imagePath, failure];
}
