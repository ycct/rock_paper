import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_paper/ui/home_screen.dart';

import 'algo_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}