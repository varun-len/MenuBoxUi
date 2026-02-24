import 'package:flutter/material.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/ui/homepage/helper/all_stores_card.dart';
import 'package:kodytest/ui/homepage/helper/recent_card.dart';
import 'package:kodytest/util/app_constants.dart';
import 'package:kodytest/util/themes/app_colors.dart';
import 'package:kodytest/util/widgets/card_offers.dart';
import 'package:kodytest/util/widgets/carousel_slider.dart';
import 'package:kodytest/util/widgets/custom_text.dart';
import 'package:kodytest/util/widgets/customized_appbar.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomizedAppbar(),
            SizedBox(height: 20),
            ResponsiveCarousel(imageUrls: HomePageController.modelBanner),
            SizedBox(height: 10),
            CustomText(
              text: str_categories,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: HomePageController.modelCategory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1, // square cells for balance
              ),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 75,
                      // fixed size for circle
                      height: 75,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        HomePageController.modelCategory[index].image ?? '',
                        fit: BoxFit.cover, // ensures proper fitting
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      HomePageController.modelCategory[index].name ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
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
              child: SizedBox(
                height: 120, // give fixed height for horizontal list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomePageController.stores?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RecentCard(index: index),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
              height: 20,
            ),
            ResponsiveCarouselExcitingOffers(),
            SizedBox(
              height: 20,
            ),
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
                  itemCount: HomePageController.spotlight?.length ?? 0,
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
                                HomePageController.spotlight?[index].image ?? '',
                              ),
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text:
                              HomePageController.spotlight?[index].name ?? '',
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
                  itemCount:HomePageController.stores?.length, itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AllStoresCard(index: index),
                    );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
