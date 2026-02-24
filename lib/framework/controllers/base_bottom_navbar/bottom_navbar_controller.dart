
import 'package:flutter/material.dart';
import 'package:kodytest/framework/repository/models/bottomnavbar_model.dart';
import 'package:kodytest/ui/homepage/base_homepage.dart';
import 'package:kodytest/util/app_constants.dart';


class BottomController {
  static int selectedIndex=0;
  static List<BottomModel> bottomList = [
    BottomModel(
      name: "Home",
      iconName: Icon(Icons.home),
      color: Colors.black,
      isSelected: true,
      body:BaseHomePage(),
      id: 0
    ),
    BottomModel(
      name:"offer",
      iconName: Icon(Icons.calendar_month),
      color: Colors.black,
      body:Text("booking"),
      id:1,
    ),
    BottomModel(
      name: str_explore,
      iconName: Icon(Icons.explore),
      color: Colors.black,
      body: Text("booking"),
      id: 2,
    ),
    BottomModel(
      name: str_favourite,
      iconName: Icon(Icons.favorite_outline),
      color: Colors.black,
      body: Text("booking"),
      id: 3
    ),
  ];
}