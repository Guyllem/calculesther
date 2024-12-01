import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.topLayout,
              padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              alignment: Alignment.bottomRight,
              child: const Text("0",
                style: TextStyle(
                  fontSize: 100,
                  fontFamily: "Filxgirl",
                  color: AppColors.text),
                  textAlign: TextAlign.right,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.black,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        minimumSize: const WidgetStatePropertyAll(Size(80, 80)),
                        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(
                            color: AppColors.topLayout,
                            width: 7
                          )
                          )
                        )
                      ),
                      child: const Text("1",
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
