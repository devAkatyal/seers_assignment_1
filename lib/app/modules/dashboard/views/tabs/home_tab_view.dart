import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seers_assignment/app/modules/dashboard/controllers/home_controller.dart';

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
            const SizedBox(height: 30),
            const _SectionHeader(title: 'Featured Category'),
            const SizedBox(height: 20),
            const _FeaturedCategories(),
            const SizedBox(height: 30),
            const _UpcomingEventsHeader(),
            const SizedBox(height: 20),
            const _UpcomingEventsCarousel(),
            const SizedBox(height: 20),
            const _SeeAllButton(),
            const SizedBox(height: 30),
            const _SectionHeader(title: 'Artists on Tixoo'),
            const SizedBox(height: 20),
            const _ArtistsCarousel(),
            const SizedBox(height: 20),
            const _SeeAllButton(text: 'All Artists'),
            const SizedBox(height: 30),
            const _SectionHeader(title: 'Trending'),
            const SizedBox(height: 20),
            const _TrendingCarousel(),
            const SizedBox(height: 30),
            const _SectionHeader(title: 'Popular Events'),
            const SizedBox(height: 20),
            const _UpcomingEventsCarousel(),
            const SizedBox(height: 20),
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
            child: Divider(color: Color(0xFF31343B), thickness: 0.5),
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
            child: Divider(color: Color(0xFF31343B), thickness: 0.5),
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
      height: 50,
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF9AFF00), width: 1),
      ),
      child: const Row(
        children: [
          Icon(Icons.mic, color: Colors.white, size: 18),
          SizedBox(width: 8),
          Text('Music', style: TextStyle(color: Colors.white)),
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
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Apply Filters', style: TextStyle(color: Colors.white)),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
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
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/image_placeholder1.png',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Kevin Hart: Acting My Age | India',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Indira Gandhi Arena, Delhi',
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '₹699',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
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
      height: 100,
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
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/image_placeholder1.png'),
          ),
          const SizedBox(height: 8),
          const Text(
            'Lana Del Ray',
            style: TextStyle(color: Colors.white, fontSize: 12),
            overflow: TextOverflow.ellipsis,
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
          height: 250,
          child: PageView.builder(
            clipBehavior: Clip.none,
            controller: controller.trendingEventsPageController,
            onPageChanged: controller.onTrendingPageChanged,
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
            currentPage: controller.trendingEventsCurrentPage.value,
          ),
        ),
      ],
    );
  }
}
