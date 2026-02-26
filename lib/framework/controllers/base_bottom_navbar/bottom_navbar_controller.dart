
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kodytest/framework/repository/models/bottomnavbar_model.dart';
import 'package:kodytest/ui/homepage/base_homepage.dart';
import 'package:kodytest/util/app_constants.dart';

final bottomControllerProvider=ChangeNotifierProvider((ref){
  return BottomController();
});

class BottomController extends ChangeNotifier{
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

  void setIndex(int index){
    BottomController.selectedIndex=index;
    for(int i=0;i<BottomController.bottomList.length;i++){
      BottomController.bottomList[i].isSelected=index==i;
    }
   notifyListeners();
  }
}