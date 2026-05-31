import 'package:image_picker/image_picker.dart';
import 'package:memory_map/shared/shared.dart';

class CameraHelper {
  CameraHelper._();

  /// Opens the camera and returns the path to the captured image,
  /// or a Failure if something went wrong.
  static Future<Either<Failure, String?>> pickImage() async {
    return eitherFutureHelper(() async {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
        maxWidth: 1500,
        maxHeight: 1500,
      );
      return image?.path;
    });
  }
}
