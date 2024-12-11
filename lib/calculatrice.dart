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
              color: AppColors.topLayout,
              padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              alignment: Alignment.bottomRight,
              child: Text(_currentTap,
                style: const TextStyle(
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
                  ButtonInterface(label: "0", onTap: (value) => _updateNumber(value)),
                  ButtonInterface(label: "1", onTap: (value) => _updateNumber(value)),
                  ButtonInterface(label: "2", onTap: (value) => _updateNumber(value)),
                  ButtonInterface(label: "CE", onTap: (value) => _clearUI())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
