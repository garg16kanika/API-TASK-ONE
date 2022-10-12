import 'package:api_task_one/currency_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin<List<DataNew>> {
  getCurrencies() async {
    try {
      change(null, status: RxStatus.loading());
      var responseData =
          await Dio().get("https://api.vpay.smarttersstudio.in/v1/currency");
      final result = List<DataNew>.from(responseData.data['data']
          .map((eachCurrencyInJson) => DataNew.fromJson(eachCurrencyInJson)));
      change(result, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }
}
