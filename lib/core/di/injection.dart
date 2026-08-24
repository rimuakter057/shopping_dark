


import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:home_shopping/features/common/controller/main_nav_controller.dart';
import 'package:home_shopping/features/seller/order/controller/home_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => NavController(), fenix: true);

    Get.lazyPut(() => HomeController(), fenix: true);


  }
}

