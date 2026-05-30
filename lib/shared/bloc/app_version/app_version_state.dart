import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionState extends Equatable {
  const AppVersionState({
    required this.build,
  });

  final PackageInfo build;

  @override
  List<Object?> get props => [build];
}
