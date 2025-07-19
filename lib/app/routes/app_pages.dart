import 'package:get/get.dart';
import 'package:seers_assignment/app/modules/home/bindings/home_binding.dart';
import 'package:seers_assignment/app/modules/home/views/home_view.dart';
import 'package:seers_assignment/app/routes/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
