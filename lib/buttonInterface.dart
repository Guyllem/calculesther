import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';

class ButtonInterface extends StatelessWidget {
  final String label;
  final Function(String) onTap;
  const ButtonInterface({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        onTap(label);
      },
      style : ButtonStyle(
        minimumSize:  const WidgetStatePropertyAll(Size(80, 80)),
        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(
            color: AppColors.topLayout,
            width: 7,
          )
          )
        )
        ),
      child: Text(label,
        style: const TextStyle(
          fontSize: 50,
        ),),
      );
  }
}

