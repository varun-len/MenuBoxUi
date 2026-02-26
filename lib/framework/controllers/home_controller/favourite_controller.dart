import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kodytest/framework/repository/models/home_model.dart';

final favouriteListProvider=ChangeNotifierProvider((ref){
  return FavouriteController();
});
class FavouriteController extends ChangeNotifier{

  List favouriteList=[];
  void addToFavourite(Store store){
    if(store.isFavourite??false){
      favouriteList.remove(store);
      store.isFavourite=false;
      print(store.isFavourite);
      print(favouriteList);
    }else{
      favouriteList.add(store);
      store.isFavourite=true;
      print(store.isFavourite);
      print(favouriteList);
    }
    notifyListeners();
  }
}