import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/helper/error_helper.dart';
import 'package:memory_map/shared/models/admin_division.dart';
import 'package:memory_map/shared/models/cemetery.dart';
import 'package:memory_map/shared/repositories/cemetery_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: CemeteryRepository)
class SupabaseCemeteryRepository implements CemeteryRepository {
  SupabaseCemeteryRepository(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<Either<Failure, List<Cemetery>>> getCemeteries({
    String? query,
    double? latitude,
    double? longitude,
    String? regionId,
    String? districtId,
    String? settlementId,
  }) {
    return eitherFutureHelper(() async {
      final response = await _supabase.rpc<dynamic>(
        'rpc_get_cemeteries',
        params: {
          if (query != null && query.isNotEmpty) 'p_query': query,
          if (latitude != null) 'p_latitude': latitude,
          if (longitude != null) 'p_longitude': longitude,
          if (regionId != null && regionId.isNotEmpty) 'p_region_id': regionId,
          if (districtId != null && districtId.isNotEmpty)
            'p_district_id': districtId,
          if (settlementId != null && settlementId.isNotEmpty)
            'p_settlement_id': settlementId,
        },
      );

      final rows = response as List<dynamic>;
      return rows
          .map((row) => Cemetery.fromJson(row as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<Either<Failure, Cemetery?>> getCemeteryById(String id) {
    return eitherFutureHelper(() async {
      final response = await _supabase.rpc<dynamic>(
        'rpc_get_cemeteries',
        params: {
          'p_id': id,
        },
      );

      final rows = response as List<dynamic>;
      if (rows.isEmpty) return null;
      return Cemetery.fromJson(rows.first as Map<String, dynamic>);
    });
  }

  @override
  Future<Either<Failure, List<Region>>> getRegions() {
    return eitherFutureHelper(() async {
      final response = await _supabase.rpc<dynamic>('rpc_get_regions');
      final rows = response as List<dynamic>;
      return rows
          .map((row) => Region.fromJson(row as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<Either<Failure, List<District>>> getDistricts(String regionId) {
    return eitherFutureHelper(() async {
      final response = await _supabase.rpc<dynamic>(
        'rpc_get_districts',
        params: {'p_region_id': regionId},
      );
      final rows = response as List<dynamic>;
      return rows
          .map((row) => District.fromJson(row as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<Either<Failure, List<Settlement>>> getSettlements(String districtId) {
    return eitherFutureHelper(() async {
      final response = await _supabase.rpc<dynamic>(
        'rpc_get_settlements',
        params: {'p_district_id': districtId},
      );
      final rows = response as List<dynamic>;
      return rows
          .map((row) => Settlement.fromJson(row as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<Either<Failure, Cemetery>> addCemetery(Cemetery cemetery) {
    return eitherFutureHelper(() async {
      final params = <String, dynamic>{
        'p_name': cemetery.name,
        'p_location': cemetery.location,
        'p_description': cemetery.description,
        'p_latitude': cemetery.latitude,
        'p_longitude': cemetery.longitude,
        'p_region_id': cemetery.regionId,
        'p_district_id': cemetery.districtId,
        'p_settlement_id': cemetery.settlementId,
        if (cemetery.photoUrl.isNotEmpty) 'p_photo_url': cemetery.photoUrl,
      };

      final response = await _supabase.rpc<dynamic>(
        'rpc_add_cemetery',
        params: params,
      );

      final rows = response as List<dynamic>;
      if (rows.isEmpty) {
        throw Exception('rpc_add_cemetery повернув порожній результат');
      }
      return Cemetery.fromJson(rows.first as Map<String, dynamic>);
    });
  }
}
