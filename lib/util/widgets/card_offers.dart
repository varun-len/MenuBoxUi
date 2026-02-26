import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/home_controller/card_carousel_controller.dart';
import 'package:kodytest/framework/controllers/home_controller/carousel_controller.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/util/themes/app_colors.dart';
import 'package:kodytest/util/widgets/custom_text.dart';
import 'package:kodytest/util/widgets/exciting_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ResponsiveCarouselExcitingOffers extends ConsumerStatefulWidget {
  ResponsiveCarouselExcitingOffers({Key? key}) : super(key: key);

  @override
  ConsumerState<ResponsiveCarouselExcitingOffers> createState() => _ResponsiveCarouselExcitingOffersState();
}

class _ResponsiveCarouselExcitingOffersState extends ConsumerState<ResponsiveCarouselExcitingOffers> {

  @override
  Widget build(BuildContext context) {
    final baseHomeController=ref.watch(homePageChangeNotifierProvider);
    final basecardController=ref.watch(cardCarouselControllerProvider);
    final isWeb = MediaQuery.of(context).size.width > 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          carouselController: basecardController.controller,
          itemCount: baseHomeController.existingOffers?.length,
          itemBuilder: (context, index, realIndex) {
            final url = baseHomeController.existingOffers?[basecardController.activeIndex].image;
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
            ExcitingCard(index:basecardController.activeIndex)
                ]
              ),
            );
          },
          options: CarouselOptions(
            height: isWeb ? 400 : 190,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: isWeb ? 0.8 : 0.9,
            onPageChanged: (index, reason)=> basecardController.setIndex(index, ref),
          ),
        ),
        const SizedBox(height: 16),
        AnimatedSmoothIndicator(
          activeIndex: basecardController.activeIndex,
          count: baseHomeController.existingOffers!.length,
          effect: ExpandingDotsEffect(
            dotHeight: isWeb ? 12 : 8,
            dotWidth: isWeb ? 12 : 8,
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade300,
            expansionFactor: 3, // dynamic expansion
          ),
          onDotClicked: (index) => basecardController.controller.animateToPage(index),
        ),
      ],
    );
  }
}
