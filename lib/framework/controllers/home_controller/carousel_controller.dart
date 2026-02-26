import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'home_controller.dart';

final carouselControllerProvider=ChangeNotifierProvider((ref){
  return CarouselController();
});
class CarouselController extends ChangeNotifier {
  int activeIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  void setIndex(int index, dynamic ref) {
    if(index>4){
      activeIndex=0;
    }
    else{
      activeIndex = index;
    }
    notifyListeners();
  }
}