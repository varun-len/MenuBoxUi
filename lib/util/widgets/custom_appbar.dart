
import 'package:flutter/material.dart';
import 'package:kodytest/framework/controllers/base_bottom_navbar/bottom_navbar_controller.dart';
import 'package:kodytest/util/app_constants.dart';

AppBar customAppBar(BuildContext context ) {
  int selectedIndex = BottomController.selectedIndex;
  return AppBar(
    title: (BottomController.bottomList[selectedIndex].name == str_home)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined, size: 18),
              Text(
                "welcome",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          )
        : Text(
            BottomController.bottomList[selectedIndex].name ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.4,
            ),
          ),
    leading: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: Text("no ")
          );
        }
      ),
    ),
    actions: [
      Visibility(
        visible: (BottomController.bottomList[selectedIndex].name == "home"),
          child: Icon(Icons.notification_add_outlined)),
      SizedBox(width: 20),
    ],
  );
}
