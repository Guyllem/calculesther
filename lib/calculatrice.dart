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
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Container(
                    color: AppColors.black,
                    padding: const EdgeInsets.all(16),
                    child: const Text("0",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.text),
                        textAlign: TextAlign.right,
                      ),),
                  )
                ]
              ),
          Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: AppColors.deepPurple,
                    padding: const EdgeInsets.all(16),
                    child: const Text("0",
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.text),
                      textAlign: TextAlign.right,
                    ),),
                )
              ]
          )
        ],
      ),
    );
  }
}
