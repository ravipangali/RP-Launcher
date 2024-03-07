import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:get/get.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';
import 'package:ravi_launcher/src/controllers/app_list_controller.dart';
import 'package:ravi_launcher/src/widgets/app_item_widget.dart';
import 'package:ravi_launcher/src/widgets/preloader_widget.dart';

class AppListScreen extends StatelessWidget {
  AppListScreen({super.key});

  final appListController = Get.put(AppListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: InteractiveViewer(
                child: Obx(
              () => appListController.loading.value
                  ? const PreloaderWidget()
                  : Scatter(
                      delegate: ArchimedeanSpiralScatterDelegate(
                          a: 0, b: 18, ratio: 3, rotation: 0),
                      children: appListController.apps.map<Widget>((app) {
                        return AppItemWidget(
                          appName: app.appName,
                          icon: app.icon,
                          packageName: app.packageName,
                        );
                      }).toList()),
            )),
          ),
        ),
      ),
    );
  }
}
