import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/bloc/camera/camera_state.dart';
import 'package:memory_map/shared/shared.dart';

@injectable
class CameraCubit extends SafeCubit<CameraState> {
  CameraCubit() : super(const CameraState());

  Future<void> pickImage() async {
    emit(
      state.copyWith(
        status: LoadingStatus.loading,
        clearFailure: true,
        clearImagePath: true,
      ),
    );

    final result = await CameraHelper.pickImage();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: LoadingStatus.error,
            failure: failure,
          ),
        );
      },
      (imagePath) {
        if (imagePath != null) {
          emit(
            state.copyWith(
              status: LoadingStatus.loaded,
              imagePath: imagePath,
            ),
          );
        } else {
          // User cancelled
          emit(state.copyWith(status: LoadingStatus.initial));
        }
      },
    );
  }
}
