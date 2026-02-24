
import 'package:flutter/material.dart';
import 'package:kodytest/framework/controllers/base_bottom_navbar/bottom_navbar_controller.dart';
import 'package:kodytest/util/app_constants.dart';

import 'custom_text.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(text: str_LogoutPermission),
      content: Text(str_wavinghand),
      actions: [
        FilledButton(onPressed: (){
          BottomController.selectedIndex=0;
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
          //   return LoginPage();
          // }), (Route<dynamic> route)=>false);
        }, child: Text(str_Yes)),
        FilledButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text(str_No))
      ],
    );;
  }
}
