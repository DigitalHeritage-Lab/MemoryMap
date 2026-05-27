import 'package:empty_template/shared/helper/error_helper.dart';
import 'package:empty_template/shared/models/grave.dart';

abstract class GraveRepository {
  Future<Either<Failure, List<Grave>>> getGraves({
    required int limit,
    required int offset,
    String? query,
    String? cemeteryId,
  });
  Future<Either<Failure, Grave>> addGrave(Grave grave);
}
