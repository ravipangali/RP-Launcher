import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';
import 'package:ravi_launcher/src/constants/string_constant.dart';
import 'package:ravi_launcher/src/controllers/speech_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List items = [
    {'icon': Icons.widgets, 'path': 'appList'},
    {'icon': Icons.home, 'path': 'home'},
    {'icon': Icons.search, 'path': 'search'},
  ];

  final speechController = Get.put(SpeechController());

  Future<void> speak() async {
    await speechController.speak(StringConstant.greetingIntro);
  }

  @override
  Widget build(BuildContext context) {
    speak();
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Center(
        child: Stack(
          children: [
            // FullBody
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting
                  Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(StringConstant.greetingIntro,
                            textStyle: const TextStyle(
                              fontFamily: 'Morethathuman',
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              // shadows: [BoxShadow(color: Colors.yellow.shade600, blurRadius: 10, spreadRadius: 2, offset: const Offset(0, 0))]
                            ),
                            cursor: '',
                            speed: const Duration(milliseconds: 50)),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  ),
                ],
              ),
            ),

            // Viewing Button
            Container(
              alignment: Alignment.center,
              child: Text('RP',
                  style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
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
