import 'package:get/get.dart';
import 'package:seers_assignment/app/modules/dashboard/bindings/home_binding.dart';
import 'package:seers_assignment/app/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    // Add HomeBinding to the dependencies
    HomeBinding().dependencies();
  }
}
