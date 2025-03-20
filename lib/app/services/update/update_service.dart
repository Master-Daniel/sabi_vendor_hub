import 'dart:io';
import 'package:flutter_upgrade_version/flutter_upgrade_version.dart';
import 'package:sabi_vendor_hub_mobile/app/utils/app_logger.dart';

class UpdateService {
  PackageInfo _packageInfo = PackageInfo();
  Future<void> checkForUpdate() async {
    _packageInfo = await PackageManager.getPackageInfo();
    appLog("Package Info: ${_packageInfo.toJson()}");
    appLog("CHECKING FOR UPDATE");
    try {
      if (Platform.isAndroid) {
        InAppUpdateManager manager = InAppUpdateManager();
        AppUpdateInfo? appUpdateInfo = await manager.checkForUpdate();
        if (appUpdateInfo == null) return;
        if (appUpdateInfo.updateAvailability ==
            UpdateAvailability.developerTriggeredUpdateInProgress) {
          //If an in-app update is already running, resume the update.
          String? message =
              await manager.startAnUpdate(type: AppUpdateType.immediate);
          appLog(message ?? '');
        } else if (appUpdateInfo.updateAvailability ==
            UpdateAvailability.updateAvailable) {
          ///Update available
          if (appUpdateInfo.immediateAllowed) {
            String? message =
                await manager.startAnUpdate(type: AppUpdateType.immediate);
            appLog(message ?? '');
          } else if (appUpdateInfo.flexibleAllowed) {
            String? message =
                await manager.startAnUpdate(type: AppUpdateType.flexible);
            appLog(message ?? '');
          } else {
            appLog(
              'Update available. Immediate & Flexible Update Flow not allow',
            );
          }
        }
      } else if (Platform.isIOS) {
        VersionInfo? versionInfo = await UpgradeVersion.getiOSStoreVersion(
          packageInfo: _packageInfo,
          regionCode: "TR",
        );
        appLog(versionInfo.toJson().toString());
      }
    } catch (e) {
      appLog("Error: $e", "Failed to check for update");
    }
  }
}
