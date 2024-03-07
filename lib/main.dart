import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ravi_launcher/src/screens/app_list_screen.dart';
import 'package:ravi_launcher/src/screens/home_screen.dart';
import 'package:ravi_launcher/src/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
    ));
    return GetMaterialApp(
      title: "RP Launcher",
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => HomeScreen(),
        'search': (context) => SearchScreen(), 
        'appList': (context) => AppListScreen(), 
      },
      home: HomeScreen(),
    );
  }
}
