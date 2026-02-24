import 'package:flutter/material.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/util/themes/app_colors.dart';
import 'package:kodytest/util/widgets/custom_text.dart';

class ExcitingCard extends StatelessWidget {
  final int index;
  const ExcitingCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:80,
      width: double.infinity,
      child: Row(
        children: [
          Image.network(HomePageController.existingOffers?[index].image??''),
          Container(
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text:HomePageController.existingOffers?[index].name??'',fontWeight: FontWeight.bold,fontSize: 14),
                  CustomText(text:HomePageController.existingOffers?[index].subtitle??'',fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.clrGrey,),
                  Expanded(child: CustomText(text:HomePageController.existingOffers?[index].offerTitle??'',fontWeight: FontWeight.w500,fontSize: 9))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
