import 'package:flutter/material.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/util/themes/app_colors.dart';
import 'package:kodytest/util/widgets/custom_text.dart';

class AllStoresCard extends StatelessWidget {
  final int index;
  const AllStoresCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
                  HomePageController.stores?[index].banner ?? '',
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
                    child: Image.network(HomePageController.stores?[index].image ?? '',),
                  ))
            ],
          ),
          Row(
            children: [

              CustomText(
                text: HomePageController.stores?[index].name??'',
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
          Row(
            children: [
              Icon(Icons.star,color: Colors.black,size: 16,),
              CustomText(
                text: HomePageController.stores?[index].rating??'',
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
                text: HomePageController.stores?[index].deliveryTime??'',
                fontSize: 16,
                color: AppColors.clrGrey,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "Min Order ",
                fontSize: 16,
                color: AppColors.clrGrey,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: HomePageController.stores?[index].minOrder??'',
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
                text: HomePageController.stores?[index].distance??'',
                fontSize: 16,
                color: AppColors.clrGrey,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),

        ],
      ),
    );
  }
}
