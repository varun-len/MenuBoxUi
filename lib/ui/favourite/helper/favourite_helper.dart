import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/home_controller/favourite_controller.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/util/themes/app_colors.dart';
import 'package:kodytest/util/widgets/custom_text.dart';

class FavouriteHelper extends ConsumerStatefulWidget {
  final int index;
  const FavouriteHelper({super.key, required this.index});

  @override
  ConsumerState<FavouriteHelper> createState() => _FavouriteHelperState();
}

class _FavouriteHelperState extends ConsumerState<FavouriteHelper> {
  @override
  Widget build(BuildContext context) {
    final baseHomeController=ref.watch(homePageChangeNotifierProvider);
    final favController=ref.watch(favouriteListProvider);
    return  Container(
      height: 225,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),boxShadow: [
        BoxShadow(
            color: AppColors.clrGreyShade300,
            blurRadius: 1,
            spreadRadius: 0.8
        ),

      ],color: Colors.white),
      child:Column(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity, // forces full width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  favController.favouriteList[widget.index].banner ?? '',
                  fit: BoxFit.cover, // ensures it fills the box
                ),
              ),
              Positioned(
                  top: 50,
                  left: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(favController.favouriteList[widget.index].image ?? '',),
                  )),
              Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: (){
                      favController.addToFavourite(favController.favouriteList[widget.index]);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black45,border:BoxBorder.all(color: Colors.red)),
                      child: Icon(Icons.favorite,size: 20,color:(favController.favouriteList[widget.index].isFavourite??true)?Colors.red:Colors.black,),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [

                  CustomText(
                    text: favController.favouriteList[widget.index].name??'',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CustomText(
                    text:"Free Delivery" ,
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Icon(Icons.star,color: Colors.black,size: 16,),
                CustomText(
                  text: favController.favouriteList[widget.index].rating??'',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 2,
                ),
                CustomText(
                  text: "(40+)",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.clrGrey,
                ),
                Spacer(),
                Icon(Icons.alarm,size: 16,),
                CustomText(
                  text: favController.favouriteList[widget.index].deliveryTime??'',
                  fontSize: 16,
                  color: AppColors.clrGrey,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                CustomText(
                  text: "Min Order ",
                  fontSize: 16,
                  color: AppColors.clrGrey,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: favController.favouriteList[widget.index].minOrder??'',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 2,
                ),
                CustomText(
                  text: "INR",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.clrBlack,
                ),
                Spacer(),
                Icon(Icons.location_pin,size: 16,),
                CustomText(
                  text:favController.favouriteList[widget.index].distance??'',
                  fontSize: 16,
                  color: AppColors.clrGrey,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(favController.favouriteList[widget.index].offer?.title??'',style: TextStyle(color: Colors.white),),
                  Text(favController.favouriteList[widget.index].offer?.code??'',style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

