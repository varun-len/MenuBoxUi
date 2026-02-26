import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/home_controller/carousel_controller.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ResponsiveCarousel extends ConsumerStatefulWidget{
  const ResponsiveCarousel({Key? key}) : super(key: key);

  @override
  ConsumerState<ResponsiveCarousel> createState() => _ResponsiveCarouselState();
}

class _ResponsiveCarouselState extends ConsumerState<ResponsiveCarousel> {


  @override
  Widget build(BuildContext context) {
    final carouselProvider=ref.watch(carouselControllerProvider);
    final homPageProvider=ref.watch(homePageChangeNotifierProvider);
    final isWeb = MediaQuery.of(context).size.width > 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          carouselController: carouselProvider.controller,
          itemCount: homPageProvider.modelBanner.length,
          itemBuilder: (context, index, realIndex) {
            final url = homPageProvider.modelBanner[carouselProvider.activeIndex];
            return  Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: isWeb ? 400 : 140,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: isWeb ? 0.8 : 0.75,
            onPageChanged: (index, reason)=> carouselProvider.setIndex(index, ref),
          ),
        ),
        const SizedBox(height: 16),
        AnimatedSmoothIndicator(
          activeIndex: carouselProvider.activeIndex,
          count: homPageProvider.modelBanner.length,
          effect: ExpandingDotsEffect(
            dotHeight: isWeb ? 12 : 8,
            dotWidth: isWeb ? 12 : 8,
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade300,
            expansionFactor: 3, // dynamic expansion
          ),
          onDotClicked: (index) => carouselProvider.controller.animateToPage(index),
        ),
      ],
    );
  }
}
