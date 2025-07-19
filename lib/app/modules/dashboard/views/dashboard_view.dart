import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seers_assignment/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:seers_assignment/app/modules/dashboard/views/tabs/favorites_tab_view.dart';
import 'package:seers_assignment/app/modules/dashboard/views/tabs/home_tab_view.dart';
import 'package:seers_assignment/app/modules/dashboard/views/tabs/list_tab_view.dart';
import 'package:seers_assignment/app/modules/dashboard/views/tabs/presentation_tab_view.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            HomeTabView(),
            ListTabView(),
            PresentationTabView(),
            FavoritesTabView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavItem(0, 'assets/images/ic_home.png', 'Home'),
                  _buildNavItem(1, 'assets/images/ic_ticket.png', 'Apps'),
                  _buildNavItem(2, 'assets/images/ic_stand.png', 'Present'),
                  _buildNavItem(3, 'assets/images/ic_fav.png', 'Favorites'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String imageAsset, String label) {
    final isSelected = controller.tabIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeTabIndex(index),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF9AFF00) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            imageAsset,
            color: isSelected ? Colors.black : Colors.grey[400],
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
