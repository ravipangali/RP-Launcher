import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';

class AppListController extends GetxController {
  RxBool loading = true.obs;
  RxList apps = [].obs;

  AppListController() {
    loadApps();
  }

  loadApps() async {
    List<Application> tempApps =
        await DeviceApps.getInstalledApplications(includeAppIcons: true, includeSystemApps: true, onlyAppsWithLaunchIntent: true);
    apps.value = tempApps;
    loading.value = false;
  }
}
