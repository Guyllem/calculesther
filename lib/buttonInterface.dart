import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';

class ButtonInterface extends StatelessWidget {
  final String label;
  final double interfaceSize;
  final double width;
  final double height;
  final Function(String) onTap;
  const ButtonInterface({super.key, required this.label, required this.interfaceSize, required this.onTap, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onTap(label);
        },
        style : ElevatedButton.styleFrom(
            backgroundColor:AppColors.black,
            shadowColor: AppColors.details,
            elevation: 10,
            side: const BorderSide(color: AppColors.purple, width: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            )
        ),
        child: Text(label,
          style: TextStyle(
            fontSize: interfaceSize,
            color: AppColors.text,
            shadows: const <Shadow> [
              Shadow(
                offset: Offset(0,0),
                blurRadius: 10,
                color: AppColors.details,
              )
            ],
          ),
        ),
      )
      );
  }
}

