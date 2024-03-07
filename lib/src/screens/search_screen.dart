import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';
import 'package:ravi_launcher/src/controllers/mine_search_controller.dart';
import 'package:ravi_launcher/src/widgets/app_item_widget.dart';
import 'package:ravi_launcher/src/widgets/mine_search_widget.dart';
import 'package:ravi_launcher/src/widgets/preloader_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final searchController = Get.put(MineSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: primaryColor,
        foregroundColor: primaryTextColor,
        elevation: 1,
        title: MineSearchWidget(searchController: searchController),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => searchController.appList.isEmpty
              ? const PreloaderWidget()
              : ListView(
                  children: searchController.appList.map<Widget>((app) {
                    return AppItemWidget(
                        packageName: app['packageName'],
                        icon: app['icon'],
                        appName: app['appName']);
                  }).toList(),
                ),
        ),
      ),
    );
  }
}
