import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/di/injection.config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  // Register SupabaseClient so it can be injected into repositories
  getIt
    ..registerLazySingleton<SupabaseClient>(
      () => Supabase.instance.client,
    )
    ..init();
}
