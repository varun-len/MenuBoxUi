import 'package:flutter/material.dart'hide Banner;
import 'package:flutter/services.dart';
import 'package:kodytest/framework/repository/models/home_model.dart';
import 'package:kodytest/util/app_constants.dart';

class HomePageController {
  Home? home;
  static List<String> modelBanner = [];
  static List<Category> modelCategory = [];
  static List<Category>? recentOrders=[];
  static List<ExistingOffer>? existingOffers=[];
  static List<Category>? spotlight=[];
  static List<Store>? stores=[];

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
  }
}