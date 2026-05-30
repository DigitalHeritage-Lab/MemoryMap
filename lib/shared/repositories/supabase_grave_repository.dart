import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/helper/error_helper.dart';
import 'package:memory_map/shared/models/grave.dart';
import 'package:memory_map/shared/repositories/grave_repository.dart';
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
      String? hashString;

      // Calculate hash on client
      if (grave.photoUrl.isNotEmpty) {
        final file = File(grave.photoUrl);
        if (file.existsSync()) {
          final bytes = await file.readAsBytes();
          hashString = await compute(
            (List<int> bytes) => sha256.convert(bytes).toString(),
            bytes,
          );
        }
      }

      // Fallback to text hash
      if (hashString == null) {
        final data = '${grave.name}${grave.birthDate}${grave.deathDate}';
        hashString = await compute(
          (String data) => md5.convert(utf8.encode(data)).toString(),
          data,
        );
      }

      final params = <String, dynamic>{
        'p_cemetery_id': grave.cemeteryId,
        'p_name': grave.name,
        'p_birth_date': grave.birthDate,
        'p_death_date': grave.deathDate,
        'p_latitude': grave.latitude,
        'p_longitude': grave.longitude,
        'p_bio': grave.bio,
        'p_hash': hashString,
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
