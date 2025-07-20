import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seers_assignment/app/modules/dashboard/controllers/home_controller.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class HomeTabView extends GetView<HomeController> {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    // The main scaffold for the home tab, with a dark background.
    return Scaffold(
      backgroundColor: const Color(0xFF0C0E12),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 20, bottom: 96),
          children: [
            const _Header(),
            const SizedBox(height: 40),
            const _SectionHeader(title: 'Featured Events'),
            const SizedBox(height: 12),
            const _FeaturedEventsCarousel(),
            const SizedBox(height: 36),
            const _SectionHeader(title: 'Featured Category'),
            const SizedBox(height: 24),
            const _FeaturedCategories(),
            const SizedBox(height: 44),
            const _UpcomingEventsHeader(),
            const SizedBox(height: 24),
            const _UpcomingEventsCarousel(),
            const SizedBox(height: 16),
            const _SeeAllButton(),
            const SizedBox(height: 52),
            const _SectionHeader(title: 'Artists on Tixoo'),
            const SizedBox(height: 20),
            const _ArtistsCarousel(),
            const SizedBox(height: 8),
            const _SeeAllButton(text: 'All Artists'),
            const SizedBox(height: 36),
            const _SectionHeader(title: 'Trending'),
            const SizedBox(height: 30),
            const _TrendingCarousel(),
            const SizedBox(height: 48),
            const _SectionHeader(title: 'Popular Events'),
            const SizedBox(height: 36),
            const _UpcomingEventsCarousel(),
            const SizedBox(height: 48),
            const _SeeAllButton(),
          ],
        ),
      ),
    );
  }
}

// --- UI Unit Widgets ---

/// Header: Displays location and search bar.
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/ic_location.png',
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mayur Vihar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lucknow, India',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFF31343B), width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('assets/images/ic_search.png'),
                  width: 20,
                  height: 20,
                  color: Colors.grey,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      hintText: 'Search for events',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// SectionHeader: A reusable header for different sections.
class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 52,
            child: Divider(color: Color(0xFF61656C), thickness: 0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 52,
            child: Divider(color: Color(0xFF61656C), thickness: 0.5),
          ),
        ],
      ),
    );
  }
}

/// FeaturedEventsCarousel: Horizontally scrolling list of featured events.
class _FeaturedEventsCarousel extends GetView<HomeController> {
  const _FeaturedEventsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 420,
          child: PageView.builder(
            clipBehavior: Clip.none,
            controller: controller.featuredEventsPageController,
            onPageChanged: controller.onFeaturedPageChanged,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const _FeaturedEventCard();
            },
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => _PageIndicator(
            pageCount: 5,
            currentPage: controller.featuredEventsCurrentPage.value,
          ),
        ),
      ],
    );
  }
}

/// _FeaturedEventCard: A card for the "Featured Events" section.
class _FeaturedEventCard extends StatelessWidget {
  const _FeaturedEventCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/image_placeholder1.png',
              height: 360,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Nelangsa Randung in Delhi 2025',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Indira Gandhi Arena, Delhi',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

/// PageIndicator: A set of dots to indicate the current page in a carousel.
class _PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const _PageIndicator({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isSelected = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isSelected ? 20 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isSelected ? const Color(0xFF9AFF00) : Color(0xFFD9D9D9),
          ),
        );
      }),
    );
  }
}

/// FeaturedCategories: Horizontally scrolling list of category chips.
class _FeaturedCategories extends StatelessWidget {
  const _FeaturedCategories();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return const _CategoryChip();
        },
      ),
    );
  }
}

/// _CategoryChip: A chip for the "Featured Category" section.
class _CategoryChip extends StatelessWidget {
  const _CategoryChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x00000000),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF9AFF00), width: 1),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/ic_mic.png',
            width: 20,
            height: 24,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          const Text(
            'Music',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// UpcomingEventsHeader: Header for the "Upcoming Events" section.
class _UpcomingEventsHeader extends StatelessWidget {
  const _UpcomingEventsHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const _SectionHeader(title: 'Upcoming Events'),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF31343B), width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Apply Filters',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFCECFD2),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    'assets/images/ic_dropdown.png',
                    width: 8,
                    height: 4,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// UpcomingEventsCarousel: Horizontally scrolling list of upcoming events.
class _UpcomingEventsCarousel extends StatelessWidget {
  const _UpcomingEventsCarousel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          return const _UpcomingEventCard();
        },
      ),
    );
  }
}

/// _UpcomingEventCard: A card for the "Upcoming Events" section.
class _UpcomingEventCard extends StatelessWidget {
  const _UpcomingEventCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF373A41),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF22262F),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Image.asset(
                    'assets/images/image_placeholder1.png',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: _DateWidget(day: 'Wed', date: '30 April 2025'),
                ),
                const Positioned(
                  top: 2,
                  right: 2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.favorite, color: Color(0xFF9AFF00), size: 28),
                      Icon(Icons.favorite, color: Colors.black, size: 24),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 10, 16, 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF22262F),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kevin Hart: Acting My Age \n| India ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Indira Gandhi Arena, Delhi',
                      style: TextStyle(
                        color: Color(0xFFF7F7F7).withOpacity(0.6),
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const _DashedLine(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Starts from',
                              style: TextStyle(
                                color: Color(0xFFF7F7F7).withOpacity(0.4),
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '₹699',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF9AFF00),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateWidget extends StatelessWidget {
  final String day;
  final String date;

  const _DateWidget({required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LayoutGrid(
        areas: '''
          day
          divider
          date
        ''',
        columnSizes: [auto],
        rowSizes: [auto, auto, auto],
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            color: const Color(0xFF333333),
            child: const Text(
              'Wed',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).inGridArea('day'),
          const Divider(
            color: Colors.white,
            height: 1,
            thickness: 1,
          ).inGridArea('divider'),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            color: const Color(0xFF13161B),
            child: const Text(
              '30 April 2025',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ).inGridArea('date'),
        ],
      ),
    );
  }
}

class _DashedLine extends StatelessWidget {
  const _DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        const dashHeight = 1.0;
        const dashSpace = 3.0;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return const SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            );
          }),
        );
      },
    );
  }
}

/// SeeAllButton: A reusable button to see all items in a category.
class _SeeAllButton extends StatelessWidget {
  final String text;

  const _SeeAllButton({this.text = 'See all'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

/// ArtistsCarousel: Horizontally scrolling list of artists.
class _ArtistsCarousel extends StatelessWidget {
  const _ArtistsCarousel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return const _ArtistAvatar();
        },
      ),
    );
  }
}

/// _ArtistAvatar: A circular avatar and name for an artist.
class _ArtistAvatar extends StatelessWidget {
  const _ArtistAvatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF99FE00),
            child: CircleAvatar(
              radius: 39, // 40 - 2px for border
              backgroundImage: AssetImage(
                'assets/images/image_placeholder1.png',
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Lana Del Ray',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// A card for the "Trending" section.
class _TrendingEventCard extends StatelessWidget {
  const _TrendingEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/image_placeholder1.png',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

/// TrendingCarousel: A carousel for trending events.
class _TrendingCarousel extends GetView<HomeController> {
  const _TrendingCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            clipBehavior: Clip.none,
            controller: controller.trendingEventsPageController,
            onPageChanged: controller.onTrendingPageChanged,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const _TrendingEventCard();
            },
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => _PageIndicator(
            pageCount: 5,
            currentPage: controller.trendingEventsCurrentPage.value,
          ),
        ),
      ],
    );
  }
}
