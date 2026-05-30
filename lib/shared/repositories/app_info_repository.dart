import 'package:injectable/injectable.dart';
import 'package:memory_map/shared/shared.dart';
import 'package:package_info_plus/package_info_plus.dart';

@Singleton(order: -2)
class AppInfoRepository {
  static PackageInfo defaultValue = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  Future<Either<Failure, PackageInfo>> getBuildInfo() async {
    return eitherFutureHelper(PackageInfo.fromPlatform);
  }
}
