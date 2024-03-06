import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';
import 'package:ravi_launcher/src/screens/app_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Center(
        child: InkWell(
          onTap: () => Get.to(AppListScreen()),
          child: Text("RP",
              style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 50,
                  fontWeight: FontWeight.bold)),
        ),
      )),
    );
  }
}
