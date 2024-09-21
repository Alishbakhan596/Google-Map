import 'package:api_key_class/pages/map_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // theme: ThemeData(
      //     primarySwatch: Colors.blue,
      //     visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MapPage(),
      //HomeScreen(),
    );
  }
}
