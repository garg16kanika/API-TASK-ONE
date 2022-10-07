import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool isSelected = false.obs;
  changeStatus() {
    isSelected.toggle();
  }
}
