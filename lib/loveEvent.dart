
import 'package:flutter/material.dart';
import 'theme/colors.dart';

class LoveEvent{

  static Future<void> bubbleText(BuildContext context, int random) async {
    if (random > 10){
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return const AlertDialog(
              backgroundColor: AppColors.purple,
              title: Text("Boîte à Amoureuse", style:
                TextStyle(
                  fontFamily: "Lexend-Regular",
                  color: AppColors.text,
                  fontSize: 25
                ),
              ),
              content: Text("Je t'aime", style:
                TextStyle(
                  color: AppColors.text,
                  fontSize: 15,
                ),
              )
            );
          });
    }
  }
}