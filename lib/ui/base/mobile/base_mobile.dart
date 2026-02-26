import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/base_bottom_navbar/bottom_navbar_controller.dart';
import 'package:kodytest/util/app_constants.dart';
import 'package:kodytest/util/widgets/custom_text.dart';
import 'package:kodytest/util/widgets/logout_dialog.dart';

class BaseMobile extends ConsumerStatefulWidget {
  const BaseMobile({super.key});

  @override
  ConsumerState<BaseMobile> createState() => _BaseMobileState();
}

class _BaseMobileState extends ConsumerState<BaseMobile> {
  int index = BottomController.selectedIndex;
  @override
  Widget build(BuildContext context) {
    final bottomNavbarProvider=ref.watch(bottomControllerProvider);
    return Scaffold(
        drawer:Drawer(
          child:SizedBox(
            height: 700,
            child: ListView(
              children: [
                DrawerHeader(
                    child: CustomText(text:"welcome",)
                ),
                Spacer(),
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
                    showDialog(
                      context:context, builder: (context) {
                      return LogoutDialog();
                    },
                    );


                  },
                  leading:Icon(Icons.logout_rounded),
                  title:CustomText(text: str_Logout) ,
                  trailing: CustomText(text: "👋"),
                )
              ],
            ),
          ),
        ),
        body:BottomController.bottomList[index].body,
        bottomNavigationBar:BottomNavigationBar(
          selectedItemColor:Colors.black,
          unselectedItemColor: Colors.black45,
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.greenAccent),
          showUnselectedLabels: true,
          currentIndex:index,
          onTap: (val) {
            index = val;
            bottomNavbarProvider.setIndex(index);
          },
          items: BottomController.bottomList.map((value){
            return BottomNavigationBarItem(icon: value.iconName,label: value.name);
          }).toList(),
        )
    );
  }
}
