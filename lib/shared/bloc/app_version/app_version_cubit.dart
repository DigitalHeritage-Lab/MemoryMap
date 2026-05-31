import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/repositories/app_info_repository.dart';
import 'package:memory_map/shared/shared.dart';

@injectable
class AppVersionCubit extends SafeCubit<AppVersionState> {
  AppVersionCubit({
    required AppInfoRepository buildRepository,
  })  : _buildRepository = buildRepository,
        super(
          AppVersionState(
            build: AppInfoRepository.defaultValue,
          ),
        ) {
    unawaited(_started());
  }
  final AppInfoRepository _buildRepository;

  Future<void> _started() async {
    final result = await _buildRepository.getBuildInfo();
    result.fold(
      (failure) => emit(AppVersionState(build: AppInfoRepository.defaultValue)),
      (buildInfo) => emit(AppVersionState(build: buildInfo)),
    );
  }
}
