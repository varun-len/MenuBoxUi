import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ResponsiveCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ResponsiveCarousel({Key? key, required this.imageUrls}) : super(key: key);

  @override
  State<ResponsiveCarousel> createState() => _ResponsiveCarouselState();
}

class _ResponsiveCarouselState extends State<ResponsiveCarousel> {
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
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index, realIndex) {
            final url = widget.imageUrls[index];
            return Container(
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
            height: isWeb ? 400 : 167,
            autoPlay:false,
            enlargeCenterPage: true,
            viewportFraction: isWeb ? 0.8 : 0.9,
            onPageChanged: (index, reason) => setState(() => activeIndex = index),
          ),
        ),
        const SizedBox(height: 16),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.imageUrls.length,
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
