// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:empty_template/components/cemeteries/bloc/cemeteries_bloc.dart'
    as _i705;
import 'package:empty_template/components/cemeteries/bloc/cemetery_detail_bloc.dart'
    as _i599;
import 'package:empty_template/components/digitize/bloc/digitize_bloc.dart'
    as _i140;
import 'package:empty_template/components/graves/bloc/graves_bloc.dart'
    as _i607;
import 'package:empty_template/components/map/bloc/map_bloc.dart' as _i953;
import 'package:empty_template/shared/repositories/cemetery_repository.dart'
    as _i359;
import 'package:empty_template/shared/repositories/grave_repository.dart'
    as _i1040;
import 'package:empty_template/shared/repositories/supabase_cemetery_repository.dart'
    as _i142;
import 'package:empty_template/shared/repositories/supabase_grave_repository.dart'
    as _i523;
import 'package:empty_template/shared/shared.dart' as _i525;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
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
    gh.lazySingleton<_i359.CemeteryRepository>(
        () => _i142.SupabaseCemeteryRepository(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i1040.GraveRepository>(
        () => _i523.SupabaseGraveRepository(gh<_i454.SupabaseClient>()));
    gh.factory<_i607.GravesBloc>(
        () => _i607.GravesBloc(gh<_i525.GraveRepository>()));
    gh.factory<_i705.CemeteriesBloc>(
        () => _i705.CemeteriesBloc(gh<_i525.CemeteryRepository>()));
    gh.factory<_i953.MapBloc>(
        () => _i953.MapBloc(gh<_i525.CemeteryRepository>()));
    gh.factory<_i599.CemeteryDetailBloc>(() => _i599.CemeteryDetailBloc(
          gh<_i525.CemeteryRepository>(),
          gh<_i525.GraveRepository>(),
        ));
    gh.factory<_i140.DigitizeBloc>(() => _i140.DigitizeBloc(
          gh<_i525.CemeteryRepository>(),
          gh<_i525.GraveRepository>(),
        ));
    return this;
  }
}
