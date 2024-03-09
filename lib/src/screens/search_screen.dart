import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';
import 'package:ravi_launcher/src/controllers/mine_search_controller.dart';
import 'package:ravi_launcher/src/controllers/speech_controller.dart';
import 'package:ravi_launcher/src/widgets/mine_search_widget.dart';
import 'package:ravi_launcher/src/widgets/preloader_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final searchController = Get.put(MineSearchController());
  final speechController = Get.put(SpeechController());

  @override
  Widget build(BuildContext context) {
    speechController.speak('Search your lovely app');
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: primaryColor,
        foregroundColor: primaryTextColor,
        elevation: 1,
        title: MineSearchWidget(searchController: searchController),
      ),
      body: Obx(
        () => searchController.loading.value
            ? const PreloaderWidget()
            : ListView(
                children: [
                  // Sub Heading
                  searchController.searchCtrl.value.text == "" ? const SizedBox.shrink() : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        'Search result for "${searchController.searchCtrl.value.text}"',
                        style: TextStyle(color: secondaryColor)),
                  ),

                  // List
                  ...searchController.appList.map<Widget>((app) {
                    return AppItem2Widget(
                      appName: app.appName,
                      icon: app.icon,
                      packageName: app.packageName,
                    );
                  }).toList()
                ],
              ),
      ),
    );
  }
}

class AppItem2Widget extends StatelessWidget {
  const AppItem2Widget(
      {super.key,
      required this.icon,
      required this.packageName,
      required this.appName});

  final dynamic icon;
  final dynamic packageName;
  final String appName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => DeviceApps.openApp(packageName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: primaryTextColor, width: 0.8))),
        child: Row(children: [
          Image.memory(
            icon,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 15),
          Text(appName, style: TextStyle(color: primaryTextColor))
        ]),
      ),
    );
  }
}
