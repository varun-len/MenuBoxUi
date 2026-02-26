import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'home_controller.dart';

final cardCarouselControllerProvider=ChangeNotifierProvider((ref){
  return CardCarouselController();
});
class CardCarouselController extends ChangeNotifier {
  int activeIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  void setIndex(int index, dynamic ref) {
    activeIndex = index;
    notifyListeners();
  }
}