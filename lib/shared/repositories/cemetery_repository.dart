import 'package:empty_template/shared/helper/error_helper.dart';
import 'package:empty_template/shared/models/cemetery.dart';

abstract class CemeteryRepository {
  Future<Either<Failure, List<Cemetery>>> getCemeteries({String? query});
  Future<Either<Failure, Cemetery?>> getCemeteryById(String id);
}
