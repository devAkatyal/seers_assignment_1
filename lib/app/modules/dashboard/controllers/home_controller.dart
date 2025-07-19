import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // State for the Featured Events carousel
  final PageController featuredEventsPageController = PageController(
    viewportFraction: 0.8,
  );
  final RxInt featuredEventsCurrentPage = 0.obs;

  // State for the Trending carousel
  final PageController trendingEventsPageController = PageController(
    viewportFraction: 0.8,
  );
  final RxInt trendingEventsCurrentPage = 0.obs;

  void onFeaturedPageChanged(int index) {
    featuredEventsCurrentPage.value = index;
  }

  void onTrendingPageChanged(int index) {
    trendingEventsCurrentPage.value = index;
  }

  @override
  void onClose() {
    featuredEventsPageController.dispose();
    trendingEventsPageController.dispose();
    super.onClose();
  }
}
