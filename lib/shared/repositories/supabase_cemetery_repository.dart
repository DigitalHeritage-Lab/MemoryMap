import 'package:empty_template/shared/helper/error_helper.dart';
import 'package:empty_template/shared/models/cemetery.dart';
import 'package:empty_template/shared/repositories/cemetery_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: CemeteryRepository)
class SupabaseCemeteryRepository implements CemeteryRepository {
  SupabaseCemeteryRepository(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<Either<Failure, List<Cemetery>>> getCemeteries({
    String? query,
  }) {
    return eitherFutureHelper(() async {
      final response = await _supabase.rpc<dynamic>(
        'rpc_get_cemeteries',
        params: {
          if (query != null && query.isNotEmpty) 'p_query': query,
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
      );

      final rows = response as List<dynamic>;
      final match = rows
          .map((row) => Cemetery.fromJson(row as Map<String, dynamic>))
          .where((c) => c.id == id);
      return match.isEmpty ? null : match.first;
    });
  }
}
