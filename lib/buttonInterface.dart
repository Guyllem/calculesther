import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';

class ButtonInterface extends StatefulWidget {
  final String label;
  final Function(String) onTap;
  const ButtonInterface({super.key, required this.label, required this.onTap});

  @override
  State<ButtonInterface> createState() => _ButtonInterfaceState();
}

class _ButtonInterfaceState extends State<ButtonInterface> {


  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        widget.onTap(widget.label);
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
      child: Text(widget.label,
        style: const TextStyle(
          fontSize: 50,
        ),),
      );
  }
}

