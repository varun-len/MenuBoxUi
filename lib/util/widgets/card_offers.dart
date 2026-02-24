import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/util/themes/app_colors.dart';
import 'package:kodytest/util/widgets/custom_text.dart';
import 'package:kodytest/util/widgets/exciting_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ResponsiveCarouselExcitingOffers extends StatefulWidget {
  ResponsiveCarouselExcitingOffers({Key? key}) : super(key: key);

  @override
  State<ResponsiveCarouselExcitingOffers> createState() => _ResponsiveCarouselExcitingOffersState();
}

class _ResponsiveCarouselExcitingOffersState extends State<ResponsiveCarouselExcitingOffers> {
  int activeIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: HomePageController.existingOffers?.length,
          itemBuilder: (context, index, realIndex) {
            final url = HomePageController.existingOffers?[activeIndex].image;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),

              ),
              child: Column(
                children: [
                 ExcitingCard(index: index),
                  SizedBox(
                    height: 10,
                  ),
            ExcitingCard(index: index)
                ]
              ),
            );
          },
          options: CarouselOptions(
            height: isWeb ? 400 : 190,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: isWeb ? 0.8 : 0.9,
            onPageChanged: (index, reason) => setState(() => activeIndex = index),
          ),
        ),
        const SizedBox(height: 16),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: HomePageController.existingOffers!.length,
          effect: ExpandingDotsEffect(
            dotHeight: isWeb ? 12 : 8,
            dotWidth: isWeb ? 12 : 8,
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade300,
            expansionFactor: 3, // dynamic expansion
          ),
          onDotClicked: (index) => _controller.animateToPage(index),
        ),
      ],
    );
  }
}
