import 'package:get/get.dart';

class HomeController extends GetxController {
  ///user nav
  var selectedTabIndex = 0.obs;
  void changeIndex(int index) {
    selectedTabIndex.value = index;
  }


  var selectedHistoryTabIndex = 0.obs;
  void changeHistoryIndex(int index) {
    selectedTabIndex.value = index;
  }



}
