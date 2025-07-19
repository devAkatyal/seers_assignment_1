import 'package:get/get.dart';
import 'package:seers_assignment/app/modules/dashboard/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
} 