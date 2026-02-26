import 'package:flutter/material.dart'hide Banner;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kodytest/framework/controllers/home_controller/favourite_controller.dart';
import 'package:kodytest/framework/repository/models/home_model.dart';
import 'package:kodytest/util/app_constants.dart';

final homePageChangeNotifierProvider=ChangeNotifierProvider((value){
  return HomePageController();
});


class HomePageController extends ChangeNotifier{
  Home? home;
  List<String> modelBanner = [];
  List<Category> modelCategory = [];
  List<Category>? recentOrders=[];
  List<ExistingOffer>? existingOffers=[];
  List<Category>? spotlight=[];
  List<Store>? stores=[];
  bool isLoading = false;

  Future<void> loadHomeJson() async {
    final String response = await rootBundle.loadString(
      jsonHome,
    );
    final data = homeFromJson(response);
    home = data;
    modelBanner = home?.banner ?? [];
    modelCategory = home?.categories ?? [];
    recentOrders=home?.recentOrders ?? [];
    existingOffers=home?.existingOffers ?? [];
    spotlight=home?.spotlight ?? [];
    stores=home?.stores ?? [];
    notifyListeners();
  }


}