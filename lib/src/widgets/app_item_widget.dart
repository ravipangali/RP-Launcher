import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';
import 'package:ravi_launcher/src/controllers/app_list_controller.dart';
import 'package:ravi_launcher/src/controllers/speech_controller.dart';

class AppItemWidget extends StatelessWidget {
  AppItemWidget(
      {super.key,
      required this.packageName,
      required this.icon,
      required this.appName,
      required this.controller});

  final dynamic packageName;
  final dynamic icon;
  final dynamic appName;
  final AppListController controller;
  final SpeechController speechController = Get.put(SpeechController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Uninstall App
      onLongPress: () => showPopover(
          context: context,
          shadow: [
            const BoxShadow(
                color: Colors.white,
                offset: Offset(0, 0),
                blurRadius: 20,
                spreadRadius: -5)
          ],
          bodyBuilder: (context) => InkWell(
                onTap: () async {
                  await DeviceApps.uninstallApp(packageName).whenComplete(() {
                    controller.loadApps();
                    Navigator.pop(context);
                  });
                  controller.loadApps();
                  speechController.speak(
                      "App is uninstalled. Please click on refresh button.");
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(
                    'Uninstall',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
          direction: PopoverDirection.bottom),

      // Open App
      onTap: () {
        DeviceApps.openApp(packageName);
        speechController
            .speak("Opening $appName");
      },

      // UI
      child: Container(
          margin: const EdgeInsets.all(10),
          width: 40,
          height: 90,
          child: Column(
            children: [
              Image.memory(
                icon,
                width: 40,
                height: 40,
              ),
              Text(appName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: primaryTextColor))
            ],
          )),
    );
  }
}
