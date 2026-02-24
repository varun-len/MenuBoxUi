import 'package:flutter/material.dart';
import 'package:kodytest/ui/homepage/mobile/home_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BaseHomePage extends StatelessWidget {
  const BaseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return HomePageMobile() ;
      },
    );
  }
}
