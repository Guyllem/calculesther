import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';

class ButtonInterface extends StatelessWidget {
  final String label;
  final double interfaceSize;
  final Function(String) onTap;
  const ButtonInterface({super.key, required this.label, required this.interfaceSize, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
          fontFamily: "PlaneCrash"
        ),
      ),
    );
  }
}

