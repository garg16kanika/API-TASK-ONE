import 'dart:developer';

import 'package:api_task_one/home_page_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController _controller = HomePageController();
  var responseData = '';
  String dataText = '';
  void gettingData() async {
    var responseData =
        await Dio().get("https://api.vpay.smarttersstudio.in/v1/currency");
    print(responseData.data["data"]);
    dataText = responseData.data["data"].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API TASK ONE'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              gettingData();
              _controller.isSelected.toggle();
            },
            child: Text('Click Me!'),
          ),
          Card(
            child: Obx((() {
              return _controller.isSelected.isTrue ? Text(dataText) : Text('');
            })),
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
