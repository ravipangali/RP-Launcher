import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List items = [
    {'icon': Icons.widgets, 'path': 'appList'},
    {'icon': Icons.home, 'path': 'home'},
    {'icon': Icons.search, 'path': 'search'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Center(
        child: Stack(
          children: [
            // Viewing Button
            Container(
              alignment: Alignment.center,
              child: Text('RP', style: TextStyle(color: primaryTextColor, fontSize: 50, fontWeight: FontWeight.bold)),
            ),

            // Main Circular
            CircularMenu(
              alignment: Alignment.center,
              toggleButtonColor: Colors.transparent,
              toggleButtonIconColor: Colors.transparent,
              items: items.map((item) {
                return CircularMenuItem(
                  icon: item['icon'],
                  onTap: () => Get.toNamed(item['path']),
                  iconColor: primaryColor,
                  color: primaryTextColor,
                );
              }).toList(),
            ),
          ],
        ),
      )),
    );
  }
}
