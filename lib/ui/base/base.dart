
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/base_mobile.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return BaseMobile();
      },
    );
  }
}