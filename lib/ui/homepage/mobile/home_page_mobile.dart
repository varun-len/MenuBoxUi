import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/ui/homepage/helper/all_stores_card.dart';
import 'package:kodytest/ui/homepage/helper/category_helper.dart';
import 'package:kodytest/ui/homepage/helper/recent_card.dart';
import 'package:kodytest/ui/homepage/helper/stores_section.dart';
import 'package:kodytest/util/app_constants.dart';
import 'package:kodytest/util/widgets/card_offers.dart';
import 'package:kodytest/util/widgets/carousel_slider.dart';
import 'package:kodytest/util/widgets/custom_text.dart';
import 'package:kodytest/util/widgets/customized_appbar.dart';

import '../helper/category_section.dart';

class HomePageMobile extends ConsumerStatefulWidget {
  const HomePageMobile({super.key});

  @override
  ConsumerState<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends ConsumerState<HomePageMobile> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final baseHomeController = ref.watch(homePageChangeNotifierProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomizedAppbar(),
            SizedBox(height: 20),
            ResponsiveCarousel(),
            SizedBox(height: 10),
            CustomText(
              text: str_categories,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            //----------------------------------------------Category Section------------------------------------------------------------
            CategorySection(width: width),

            //----------------------------------------------Stores Section------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: str_recentOrder,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:StoresSection(),
            ),
            SizedBox(height: 20),

            //----------------------------------------------existing Offers Section------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  CustomText(
                    text: str_exciting_offers,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CustomText(
                    text: str_viewAll,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //----------------------------------------------offers Section------------------------------------------------------------
            ResponsiveCarouselExcitingOffers(),
            SizedBox(height: 20),

            //----------------------------------------------Spotlight Section------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  CustomText(
                    text: str_InTheSpotlight,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CustomText(
                    text: str_viewAll,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 129, // give fixed height for horizontal list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: baseHomeController.spotlight?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(
                                baseHomeController.spotlight?[index].image ??
                                    '',
                              ),
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text:
                                  baseHomeController.spotlight?[index].name ??
                                  '',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            //----------------------------------------------All Stores Section------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: str_AllStores,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: baseHomeController.stores?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AllStoresCard(index: index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
