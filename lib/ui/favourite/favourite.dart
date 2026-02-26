import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/home_controller/favourite_controller.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/ui/favourite/helper/favourite_helper.dart';
import 'package:kodytest/ui/homepage/helper/all_stores_card.dart';

class Favourite extends ConsumerStatefulWidget {
  const Favourite({super.key});

  @override
  ConsumerState<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends ConsumerState<Favourite> {

  @override
  Widget build(BuildContext context) {
    final favController=ref.watch(favouriteListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount:favController.favouriteList.length ,
            itemBuilder: (context,index){
          return FavouriteHelper(index: index);
        }),
      ),
    );
  }
}
