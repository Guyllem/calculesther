import 'package:calculesther/buttonInterface.dart';
import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'utils.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {

  String _currentTap = "0";
  double? _result = 0;

  void _updateNumber(String number){
    setState(() {

      /// Gestion du premier chiffre
      if (number == "," && _currentTap.length == 1) {
        _currentTap = "$_currentTap,";
      } else if (_currentTap == "0") {
        _currentTap = number;
      }
      /// Gestion de la virgule pour pas, dans le même membre

      /// Gestion de non répétition de signe
        else if (number == " + " && _currentTap[_currentTap.length-1] != " " ||
          number == " - " && _currentTap[_currentTap.length-1] != " " ||
          number == " x " && _currentTap[_currentTap.length-1] != " " ||
          number == " / " && _currentTap[_currentTap.length-1] != " " ||
          number == "," && _currentTap[_currentTap.length-1] != ","||
      int.tryParse(number) != null){
        _currentTap = "$_currentTap$number";
      }
    });
  }

  void _updateResult(double number){
    if (_result == 0){
      _result = number;
    } else {
      _result = _result! * 10 + number;
    }
  }


  void _deleteLast(){
    setState(() {
      if (_currentTap.length == 1){
        _currentTap = "0";
      } else if (_currentTap[_currentTap.length-1] == " ") {
        _currentTap = _currentTap.substring(0, _currentTap.length - 3);
        if (_currentTap == ""){
          _currentTap = "0";
        }
      } else {
      _currentTap = _currentTap.substring(0, _currentTap.length - 1);
      }

      if (_result != 0){

      }
    });
  }

  void _clearUI(){
    setState(() {
      _currentTap = "0";
      _result = 0;
    });
  }


  void _operation() {
    setState(() {

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
              child: Text("${_result.toString()} | $_currentTap",
                style: const TextStyle(
                  fontSize: 50,
                    shadows: <Shadow> [
                      Shadow(
                        offset: Offset(2,2),
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
                    padding: const EdgeInsets.all(16),
                    color: AppColors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "", interfaceSize: 30, width: 98, height: 65,
                                    iconData: const Icon(Icons.favorite, color: AppColors.black,
                                      shadows: [Shadow(
                                          offset: Offset(0,0),
                                          blurRadius:  70,
                                          color: AppColors.details)] ,
                                      size: 40),
                                    updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "apres", interfaceSize: 15, width: 98, height: 65, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "CA", interfaceSize: 32, width: 98, height: 65, updateUI: (value) => _clearUI()),
                                ButtonInterface(label: "", interfaceSize: 30, width: 98, height: 65,
                                    image: SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/delete-arrow.png',color : AppColors.text, height: 45,  width: 45),
                                    ),
                                    updateUI: (value) => _deleteLast()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "", interfaceSize: 30, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/power_x.png',color : AppColors.text, height: 50,  width: 55),
                                    ),
                                    updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "", interfaceSize: 15, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/square-root.png',color : AppColors.text, height: 35,  width: 35),
                                    ),
                                    updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "10^", interfaceSize: 30, width: 98, height: 65, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: " / ", interfaceSize: 40, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/divide.png',color : AppColors.text, height: 30,  width: 30),
                                    ),
                                    updateUI: (value) => _updateNumber(value)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "7", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: "8", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: "9", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: " x ", interfaceSize: 40, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/times.png',color : AppColors.text, height: 26,  width: 26),
                                    ),
                                    updateUI: (value) => _updateNumber(value)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "4", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: "5", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: "6", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: " - ", interfaceSize: 40, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/minus.png',color : AppColors.text, height: 30,  width: 35),
                                    ),
                                    updateUI: (value) => _updateNumber(value)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "1", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: "2", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: "3", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: " + ", interfaceSize: 40, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/plus.png',color : AppColors.text, height: 30,  width: 30),
                                    ),
                                  updateUI: (value) => _updateNumber(value),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: ",", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "0", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value), updateResult: (value) => _updateResult(value)),
                                ButtonInterface(label: "(  )", interfaceSize: 35, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: " = ", interfaceSize: 40, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/equal.png',color : AppColors.text, height: 30,  width: 30),
                                    ),
                                  operation: () => _operation(),
                                )
                              ],
                            )
                          ],
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
