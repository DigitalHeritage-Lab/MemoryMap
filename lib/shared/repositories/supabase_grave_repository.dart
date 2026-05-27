import 'package:empty_template/shared/helper/error_helper.dart';
import 'package:empty_template/shared/models/grave.dart';
import 'package:empty_template/shared/repositories/grave_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: GraveRepository)
class SupabaseGraveRepository implements GraveRepository {
  SupabaseGraveRepository(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<Either<Failure, List<Grave>>> getGraves({
    required int limit,
    required int offset,
    String? query,
    String? cemeteryId,
  }) {
    return eitherFutureHelper(() async {
      final params = <String, dynamic>{
        'p_limit': limit,
        'p_offset': offset,
        if (query != null && query.isNotEmpty) 'p_query': query,
        if (cemeteryId != null) 'p_cemetery_id': cemeteryId,
      };

      final response = await _supabase.rpc<dynamic>(
        'rpc_get_graves',
        params: params,
      );

      final rows = response as List<dynamic>;
      return rows
          .map((row) => Grave.fromJson(row as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<Either<Failure, Grave>> addGrave(Grave grave) {
    return eitherFutureHelper(() async {
      final params = <String, dynamic>{
        'p_cemetery_id': grave.cemeteryId,
        'p_name': grave.name,
        'p_birth_date': grave.birthDate,
        'p_death_date': grave.deathDate,
        'p_latitude': grave.latitude,
        'p_longitude': grave.longitude,
        'p_bio': grave.bio,
        if (grave.photoUrl.isNotEmpty) 'p_photo_url': grave.photoUrl,
      };

      final response = await _supabase.rpc<dynamic>(
        'rpc_add_grave',
        params: params,
      );

      final rows = response as List<dynamic>;
      if (rows.isEmpty) {
        throw Exception('rpc_add_grave повернув порожній результат');
      }
      return Grave.fromJson(rows.first as Map<String, dynamic>);
    });
  }
}
