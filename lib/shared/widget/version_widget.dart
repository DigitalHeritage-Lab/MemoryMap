import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/shared/bloc/app_version/app_version_cubit.dart';
import 'package:memory_map/shared/bloc/app_version/app_version_state.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key, this.style});
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppVersionCubit, AppVersionState>(
      builder: (context, state) {
        if (state.build.version == 'Unknown') {
          return const SizedBox.shrink();
        }
        return Text(
          'v${state.build.version} (${state.build.buildNumber})',
          style: style ?? const TextStyle(color: Colors.grey, fontSize: 12),
        );
      },
    );
  }
}
