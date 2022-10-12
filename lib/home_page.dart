import 'dart:ui';

import 'package:api_task_one/currency_model.dart';
import 'package:api_task_one/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController _controller = HomePageController();

  @override
  void initState() {
    super.initState();
    _controller.getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            'API TASK ONE',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: _controller.obx(
          (currency) => _controller.state != null &&
                  _controller.status.isSuccess
              ? GridView.builder(
                  itemCount: currency!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currency[index].symbol,
                                style: const TextStyle(
                                    fontSize: 60, fontWeight: FontWeight.bold),
                              ),
                              Text(currency[index].name)
                            ],
                          )),
                    );
                  }))
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          onError: (err) {
            return Center(
              child: Text(err!),
            );
          },
        ));
  }
}
