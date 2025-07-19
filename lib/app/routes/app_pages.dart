import 'package:get/get.dart';
import 'package:seers_assignment/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:seers_assignment/app/modules/dashboard/views/dashboard_view.dart';
import 'package:seers_assignment/app/routes/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
