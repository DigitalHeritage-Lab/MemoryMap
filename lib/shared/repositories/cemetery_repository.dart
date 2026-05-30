import 'package:memory_map/shared/helper/error_helper.dart';
import 'package:memory_map/shared/models/admin_division.dart';
import 'package:memory_map/shared/models/cemetery.dart';

abstract class CemeteryRepository {
  Future<Either<Failure, List<Cemetery>>> getCemeteries({
    String? query,
    double? latitude,
    double? longitude,
    String? regionId,
    String? districtId,
    String? settlementId,
  });
  Future<Either<Failure, Cemetery?>> getCemeteryById(String id);
  Future<Either<Failure, List<Region>>> getRegions();
  Future<Either<Failure, List<District>>> getDistricts(String regionId);
  Future<Either<Failure, List<Settlement>>> getSettlements(String districtId);
  Future<Either<Failure, Cemetery>> addCemetery(Cemetery cemetery);
}
