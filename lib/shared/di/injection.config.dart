// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:memory_map/components/cemeteries/bloc/cemeteries_bloc.dart'
    as _i943;
import 'package:memory_map/components/cemeteries/bloc/cemetery_detail_bloc.dart'
    as _i119;
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart'
    as _i603;
import 'package:memory_map/components/graves/bloc/graves_bloc.dart' as _i841;
import 'package:memory_map/components/map/bloc/map_bloc.dart' as _i597;
import 'package:memory_map/shared/bloc/app_version/app_version_cubit.dart'
    as _i499;
import 'package:memory_map/shared/repositories/app_info_repository.dart'
    as _i225;
import 'package:memory_map/shared/repositories/cemetery_repository.dart'
    as _i90;
import 'package:memory_map/shared/repositories/grave_repository.dart' as _i175;
import 'package:memory_map/shared/repositories/supabase_cemetery_repository.dart'
    as _i771;
import 'package:memory_map/shared/repositories/supabase_grave_repository.dart'
    as _i299;
import 'package:memory_map/shared/shared.dart' as _i473;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i225.AppInfoRepository>(() => _i225.AppInfoRepository());
    gh.lazySingleton<_i175.GraveRepository>(
        () => _i299.SupabaseGraveRepository(gh<_i454.SupabaseClient>()));
    gh.factory<_i499.AppVersionCubit>(() =>
        _i499.AppVersionCubit(buildRepository: gh<_i225.AppInfoRepository>()));
    gh.factory<_i841.GravesBloc>(
        () => _i841.GravesBloc(gh<_i473.GraveRepository>()));
    gh.lazySingleton<_i90.CemeteryRepository>(
        () => _i771.SupabaseCemeteryRepository(gh<_i454.SupabaseClient>()));
    gh.factory<_i119.CemeteryDetailBloc>(() => _i119.CemeteryDetailBloc(
          gh<_i473.CemeteryRepository>(),
          gh<_i473.GraveRepository>(),
        ));
    gh.factory<_i603.DigitizeBloc>(() => _i603.DigitizeBloc(
          gh<_i473.CemeteryRepository>(),
          gh<_i473.GraveRepository>(),
        ));
    gh.factory<_i943.CemeteriesBloc>(
        () => _i943.CemeteriesBloc(gh<_i473.CemeteryRepository>()));
    gh.factory<_i597.MapBloc>(
        () => _i597.MapBloc(gh<_i473.CemeteryRepository>()));
    return this;
  }
}
