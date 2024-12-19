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

  /// TODO : fair eun blocage de spam de signe
  void _updateNumber(String number){
    setState(() {
      if (_currentTap == "0"){
        _currentTap = number;
      } else {
        _currentTap = "$_currentTap$number";
      }
    });
  }
  /// Todo : delete les spaces inclus dans les op
  void _deleteLast(){
    setState(() {
      if (_currentTap.length == 1){
        _currentTap = "0";
      } else {
        _currentTap = _currentTap.substring(0, _currentTap.length - 1);
      }
    });
  }

  void _clearUI(){
    setState(() {
      _currentTap = "0";
    });
  }

  void _operation() {
    setState(() {
      int result = 0;
      if (_currentTap.contains("+")) {
        List<String> members = _currentTap.split(" + ");
        for (int i = 0; i < members.length; i++) {
          int tempMember = int.tryParse(members[i]) ?? 0;

          if (tempMember == 0) continue;
          result += tempMember;
        }
        _currentTap = (result).toString();
      }
      if (_currentTap.contains("-")){
        List<String> members = _currentTap.split(" - ");
        for (int i = 0; i < members.length; i++) {
          int tempMember = int.tryParse(members[i]) ?? 0;

          if (tempMember == 0) continue;
          if (result == 0){
            result = tempMember;
          }else {
            result -= tempMember;
          }
        }
        _currentTap = (result).toString();
      }
      if (_currentTap.contains("x")){
        List<String> members = _currentTap.split(" x ");
        for (int i = 0; i < members.length; i++) {
          int tempMember = int.tryParse(members[i]) ?? 0;

          if (tempMember == 0) {
            result = 0;
          } else if (result == 0){
            result = tempMember;
          } else {
            result = result * tempMember;
          }
        }
        _currentTap = (result).toString();
      }
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
                  fontSize: 90,
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
                                    onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "apres", interfaceSize: 15, width: 98, height: 65, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "CA", interfaceSize: 35, width: 98, height: 65, onTap: (value) => _clearUI()),
                                ButtonInterface(label: "", interfaceSize: 30, width: 98, height: 65,
                                    image: Image.asset('assets/icons/delete-arrow.png',color : AppColors.text, height: 45,  width: 45), onTap: (value) => _deleteLast()),
                                /// Todo : add a shadow behind image
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "x^", interfaceSize: 30, width: 98, height: 65, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "", interfaceSize: 15, width: 98, height: 65,
                                    image: Image.asset('assets/icons/square-root.png', color : AppColors.text, height: 35, width: 35) ,onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "10^", interfaceSize: 30, width: 98, height: 65, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "/", interfaceSize: 40, width: 98, height: 65, onTap: (value) => _updateNumber(value)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "7", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "8", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "9", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: " x ", interfaceSize: 40, width: 98, height: 65, onTap: (value) => _updateNumber(value)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "4", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "5", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "6", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: " - ", interfaceSize: 40, width: 98, height: 65, onTap: (value) => _updateNumber(value)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: "1", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "2", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "3", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: " + ", interfaceSize: 40, width: 98, height: 65, onTap: (value) => _updateNumber(value)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonInterface(label: ",", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "0", interfaceSize: 40, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "(  )", interfaceSize: 35, width: 92, height: 90, onTap: (value) => _updateNumber(value)),
                                ButtonInterface(label: "=", interfaceSize: 40, width: 98, height: 65, onTap: (value) => _operation()),
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
