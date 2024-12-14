import 'package:calculesther/buttonInterface.dart';
import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {

  String _currentTap = "0";

  void _updateNumber(String number){
    setState(() {
      if (_currentTap == "0"){
        _currentTap = number;
      } else {
        _currentTap = "$_currentTap$number";
      }
    });
  }

  void _clearUI(){
    setState(() {
      _currentTap = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.black,
              padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              alignment: Alignment.bottomRight,
              child: Text(_currentTap,
                style: const TextStyle(
                  fontSize: 80,
                    shadows: <Shadow> [
                      Shadow(
                        offset: Offset(1,1),
                        blurRadius: 10,
                        color: AppColors.shadow,
                      )
                    ],
                  fontFamily: "Lexend-Regular",
                  color: AppColors.text),
                  textAlign: TextAlign.right,

              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      color: AppColors.black,
                      child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 25,
                          padding: const EdgeInsets.all(20),
                          children: [
                            ButtonInterface(label: "CE", interfaceSize: 30, onTap: (value) => _clearUI()),
                            ButtonInterface(label: "0", interfaceSize: 40, onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "1", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "2", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "3", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "4", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "5", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "6", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "7", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "8", interfaceSize: 40, onTap: (value) => _updateNumber(value)),
                            ButtonInterface(label: "9", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                          ],
                      ),
                    ),
                ),
                Expanded(
                  flex: 1,
                    child: Container(
                      color: AppColors.black,
                      child: GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 25,
                        padding: const EdgeInsets.all(20),
                        children: [
                          ButtonInterface(label: "+", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                          ButtonInterface(label: "-", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                          ButtonInterface(label: "x", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                          ButtonInterface(label: "/", interfaceSize: 40,onTap: (value) => _updateNumber(value)),
                          ButtonInterface(label: "²", interfaceSize: 40,onTap: (value) => _updateNumber(value))
                        ],
                      )
                )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
