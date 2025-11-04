import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
  }
}
