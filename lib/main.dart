import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'API TASK ONE',
      home: HomePage(),
    );
  }
}
