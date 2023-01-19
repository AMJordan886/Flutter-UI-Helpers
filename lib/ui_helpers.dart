import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



///This function return Color to hex
Color HexColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}


///Spacers
const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);



///Screen sizes
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

Future<void> vibrationService() => HapticFeedback.heavyImpact();


Future pushTo(context, route) => Navigator.push(context,MaterialPageRoute(builder: (context) => route));
Future pushToRemove(context, route) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => route),(Route<dynamic> route) => false);

BouncingScrollPhysics appliedPhysics() => const BouncingScrollPhysics();


void showSnackBar(BuildContext context, String text, Color color)=>ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(text),
    ));

showDivider({indent = 29.0, color = Colors.grey})=> Divider(
  indent: indent,
  endIndent: indent,
  height: 0,
  thickness: 1,
  color: color,
);





///Use to open a url in a browser
Future<void> pushUrl(url) async {
  if (!await launchUrl(url,
    mode: LaunchMode.externalApplication,
    webViewConfiguration: const WebViewConfiguration(),)) {
    throw 'Could not launch $url';
  }
}







class Utilities {
  static bool isKeyboardShowing(){
    if (WidgetsBinding.instance != null){
      return WidgetsBinding.instance.window.viewInsets.bottom > 0;
    } else {
      return false;
    }
  }
  static closeKeyboard(BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus){
      currentFocus.unfocus();
    }
  }
}

///In a function type to close keyboard if this is opened
/*

      if (Utilities.isKeyboardShowing()){
        Utilities.closeKeyboard();
      }

 */



