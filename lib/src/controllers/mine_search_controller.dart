import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineSearchController extends GetxController {
  RxBool loading = true.obs;
  Rx<TextEditingController> searchCtrl = TextEditingController().obs; 
  RxList appList = [].obs;

  searchApp() async {
    List<dynamic> apps =
        await DeviceApps.getInstalledApplications(includeAppIcons: true, onlyAppsWithLaunchIntent: true, includeSystemApps: true);
    appList.value = apps.where((item) => item['appName'].toLowerCase().contains(searchCtrl.value.text.toLowerCase())).toList();
    loading.value = false;
  }
}
