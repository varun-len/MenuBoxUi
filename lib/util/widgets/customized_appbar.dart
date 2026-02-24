import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kodytest/util/app_constants.dart';
import 'package:kodytest/util/themes/app_colors.dart';
import 'package:kodytest/util/widgets/custom_text.dart';


class CustomizedAppbar extends StatefulWidget {
  const CustomizedAppbar({super.key});

  @override
  State<CustomizedAppbar> createState() => _CustomizedAppbarState();
}

class _CustomizedAppbarState extends State<CustomizedAppbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColors.clr070707,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        // _scaffoldKey.currentState?.openDrawer();
                        Scaffold.of(context).openDrawer();
                      },

                      icon: Icon(Icons.menu,size: 25,),
                    );
                  },
                ),
                SizedBox(
                  width: 70,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LocationScreen(),
                    //   ),
                    // );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          CustomText(text: 'Punjab,India',color:AppColors.clrWhite,),
                          Icon(Icons.keyboard_arrow_down,color:AppColors.clrWhite),
                        ],
                      ),
                    ],
                  ),
                ),

                Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(svg_notification),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(svg_favourite),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 28,
            child: Card(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width*0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.search, size: 18),
                    SizedBox(width: 20),
                    Text("Search"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
