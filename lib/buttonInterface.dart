import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';

class ButtonInterface extends StatelessWidget {
  final String label;
  final double interfaceSize;
  final Function(String) onTap;
  const ButtonInterface({super.key, required this.label, required this.interfaceSize, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        onTap(label);
      },
      style : ButtonStyle(
        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(45),
          side: const BorderSide(
            color: AppColors.topLayout,
            width: 5,
          )
          )
        )
        ),
      child: Text(label,
        style: TextStyle(
          fontSize: interfaceSize,
        ),
      ),
    );
  }
}

