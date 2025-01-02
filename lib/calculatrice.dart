import 'package:calculesther/buttonInterface.dart';
import 'package:flutter/material.dart';
import 'package:calculesther/theme/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculatrice extends StatefulWidget {

  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {

  String _currentTap = "0";
  double? _result = 0;
  double paddingRight = 25;
  double paddingBottom = 15;
  double fontSize = 80;
  final String _racineCarree = "\u221A";


  // Update UI
  void _updateNumber(String number){
    setState(() {

      // First digit management
      if (number == "." && (_currentTap == "0" || _currentTap[_currentTap.length-1] == " " || _currentTap[_currentTap.length-1] == "-")) {
        if (_currentTap == "0"){
          _currentTap = "$_currentTap.";
        } else {
          _currentTap = "${_currentTap}0.";
        }

      // Can't add at the start
      } else if ((number == " + " || number == " * " || number == " / " || number == "^" || number == ")") && _currentTap == "0"){
        _currentTap = "0";
      } else if (number == " - "  && _currentTap == "0"){
        _currentTap = "-";
      } else if (_currentTap == "0") {
        _currentTap = number;
      }

      // Good position for minus after a specific operator
      else if (number == " - " && _currentTap.length >= 2 && (_currentTap[_currentTap.length - 1] == "(" || _currentTap[_currentTap.length-1] == "^" || _currentTap[_currentTap.length-2] == "*" || _currentTap[_currentTap.length-2] == "/"  || _currentTap[_currentTap.length-2] == "+")){
        _currentTap = "$_currentTap-";
      }


      // Comma management
      else if (number == "." && _currentTap[_currentTap.length-1] != "." && _currentTap[_currentTap.length-1] != _racineCarree && _currentTap[_currentTap.length-1] != "(" && _currentTap[_currentTap.length-1] != "^" ){
        bool isComaInMember = false;
        for (int i = _currentTap.length - 1; i >= 0; i--){

          // If already a comma in the member return true and block the add of a new comma
          if (_currentTap[i] == "."){
            isComaInMember = true;
            break;
          }

          // If space detected quit the loop without doing anything and verify if before the space we have a comma
          if (_currentTap[i] == " "){
            break;
          }
        }

        // No comma in the member --> add comma
        if (!isComaInMember){
          _currentTap = "$_currentTap$number";
        }
      }

      // 10 power management
      else if (number == "10^"){
        if (int.tryParse(_currentTap[_currentTap.length-1]) != null){
          _currentTap = "$_currentTap * 10^";
        }
        else if (_currentTap[_currentTap.length-2] == "*"){
          _currentTap = "$_currentTap$number";
        }
      }

      // Close Parenthesis management
      else if (number == ")" && _currentTap[_currentTap.length-1] != " " && _currentTap[_currentTap.length-1] != "." ){
        int countParenthesisOpen = 0;
        int countParenthesisClose = 0;
        for (int i = 0; i < _currentTap.length; i++){
          if (_currentTap[i] == "("){
            countParenthesisOpen++;
          }
          if (_currentTap[i] == ")"){
            countParenthesisClose++;
          }
        }
        if (countParenthesisOpen > countParenthesisClose){
          _currentTap = "$_currentTap$number";
        }
      }

      // Power management
      else if (number == "^" && (_currentTap[_currentTap.length-1] == ")" || int.tryParse(_currentTap[_currentTap.length-1]) != null)){
        _currentTap = "$_currentTap$number";
      }

      // Square root management
      else if (number == _racineCarree && (_currentTap[_currentTap.length-1] == " " || _currentTap[_currentTap.length-1] == "(" || _currentTap[_currentTap.length-1] == "-")){
        _currentTap = "$_currentTap$number";
      }

      // Non-recurrence of sign
      else if ((number == " + " && _currentTap[_currentTap.length-1] != " " && _currentTap[_currentTap.length-1] != "." && _currentTap[_currentTap.length-1] != "-" && _currentTap[_currentTap.length-1] != "(" && _currentTap[_currentTap.length-1] != "^" && _currentTap[_currentTap.length-1] != _racineCarree) ||
        (number == " - " && _currentTap[_currentTap.length-1] != " " && _currentTap[_currentTap.length-1] != "." && _currentTap[_currentTap.length-1] != "-" && _currentTap[_currentTap.length-1] != _racineCarree) ||
        (number == " * " && _currentTap[_currentTap.length-1] != " " && _currentTap[_currentTap.length-1] != "."  && _currentTap[_currentTap.length-1] != "-" && _currentTap[_currentTap.length-1] != "(" && _currentTap[_currentTap.length-1] != "^" && _currentTap[_currentTap.length-1] != _racineCarree) ||
        (number == " / " && _currentTap[_currentTap.length-1] != " " && _currentTap[_currentTap.length-1] != "." && _currentTap[_currentTap.length-1] != "-" && _currentTap[_currentTap.length-1] != "(" && _currentTap[_currentTap.length-1] != "^" && _currentTap[_currentTap.length-1] != _racineCarree) ||
        (number == "(" && (_currentTap[_currentTap.length-1] == " " || _currentTap[_currentTap.length-1] == "-" || _currentTap[_currentTap.length-1] == _racineCarree || _currentTap[_currentTap.length-1] == "(")) ||
        (int.tryParse(number) != null && _currentTap[_currentTap.length-1] != ")")){
      _currentTap = "$_currentTap$number";
      }
    });
  }

  // When delete button is pressed
  void _deleteLast(){
    setState(() {

      // Print 0 when last number is delete
      if (_currentTap.length == 1){
        _currentTap = "0";
      }

      // Take care of space between operator and number
      else if (_currentTap[_currentTap.length-1] == " ") {
        _currentTap = _currentTap.substring(0, _currentTap.length - 3);

        // Take care if the last entry is an operator
        if (_currentTap == ""){
          _currentTap = "0";
        }

      // Take care of 10 power
      } else if (_currentTap[_currentTap.length-1] == "^" && _currentTap[_currentTap.length-2] == "0" && _currentTap[_currentTap.length-3] == "1" ){
        _currentTap = _currentTap.substring(0, _currentTap.length - 3);

        // Take care if the last entry is an operator
        if (_currentTap == ""){
          _currentTap = "0";
        }
      }

      else {
        _currentTap = _currentTap.substring(0, _currentTap.length - 1);
      }
    });
  }

  // When "CA" button pressed (Clear All)
  void _clearUI(){
    setState(() {

      // Reset the value of the UI print and result to 0
      _currentTap = "0";
      _result = 0;

    });
  }

  // When equal button is pressed
  void _operation() {
    setState(() {

      // Calculates the expression with math_expressions package
      try {
        Parser parser = Parser();
        _currentTap = _currentTap.replaceAll(_racineCarree, "sqrt(");

        String temp = _currentTap;
        int i = temp.indexOf("sqrt(");

        while (i != -1) {
          int start = i + 5;
          int end = start;
          while (end < temp.length && temp[end] != ' ' && temp[end] != ')') {
            end++;
          }
          if (end < temp.length && temp[end] == ' ') {
            temp = "${temp.substring(0, end)})${temp.substring(end)}";
          }
          else if (end == temp.length || temp[end] != ')') {
            temp = "${temp.substring(0, end)})${temp.substring(end)}";
          }
          i = temp.indexOf("sqrt(", i + 1);
        }

        _currentTap = temp;
        Expression expression = parser.parse(_currentTap);
        ContextModel cm = ContextModel();


        _result = expression.evaluate(EvaluationType.REAL, cm);

        // Show integer when the number it is
        if (_result == _result!.toInt()){
          _currentTap = _result!.toInt().toString();
        } else {
          _currentTap = _result!.toStringAsFixed(6);

          // If the result is under 6 decimal @_currentTap == "0."
          while(_currentTap.contains(".") && _currentTap.endsWith("0")){
            _currentTap = _currentTap.substring(0, _currentTap.length - 1);
          }

          // If result is under 6 decimal, print @_currentTap with origin result (.e.)
          if (_currentTap == "0."){
            _currentTap = _result!.toString();
          }
        }

      // Catch error, when the parser return exception
      } catch (e){
        _result = 0;
        _currentTap = "0";

        Fluttertoast.showToast(
            msg: "Error : Syntax",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: AppColors.purple,
            textColor: AppColors.text,
            fontSize: 20,
            fontAsset: "assets/fonts/Lexend-Regular.ttf"
        );
      }
    });
  }

  void _calculateFontSize(){
    setState(() {
      if (_currentTap.length <= 7){
          paddingBottom = 15;
          paddingRight = 25;
          fontSize = 90;
      } else if (_currentTap.length <= 11){
          paddingBottom = 25;
          paddingRight = 25;
          fontSize = 60;
      } else if (_currentTap.length <= 38) {
        paddingBottom = 35;
        paddingRight = 25;
        fontSize = 50;
      } else {
        Fluttertoast.showToast(
          msg: "Error : Your entry is too long",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: AppColors.purple,
          textColor: AppColors.text,
          fontSize: 20,
          fontAsset: "assets/fonts/Lexend-Regular.ttf"
        );
        _currentTap = "0";
        paddingBottom = 15;
        paddingRight = 25;
        fontSize = 90;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    _calculateFontSize();
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.black,
              padding: EdgeInsets.fromLTRB(15, 10, paddingRight, paddingBottom),
              alignment: Alignment.bottomRight,
              child: Text( _currentTap,
                style: TextStyle(
                  fontSize: fontSize,
                    shadows: const <Shadow> [
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
                                ButtonInterface(label: "^", interfaceSize: 30, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/power_x.png',color : AppColors.text, height: 50,  width: 55),
                                    ),
                                    updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: _racineCarree, interfaceSize: 15, width: 98, height: 65,
                                    image:
                                    SimpleShadow(
                                      opacity: 0.7,
                                      color: AppColors.details,
                                      offset: const Offset(0,0),
                                      sigma: 3,
                                      child: Image.asset('assets/icons/square-root.png',color : AppColors.text, height: 35,  width: 35),
                                    ),
                                    updateUI: (value) => _updateNumber(value)),
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
                                ButtonInterface(label: "10^", interfaceSize: 30, width: 98, height: 65, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "(", interfaceSize: 27, width: 98, height: 65, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: ")", interfaceSize: 27, width: 98, height: 65, updateUI: (value) => _updateNumber(value)),
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
                                ButtonInterface(label: "7", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "8", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "9", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: " * ", interfaceSize: 40, width: 98, height: 65,
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
                                ButtonInterface(label: "4", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "5", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "6", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
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
                                ButtonInterface(label: "1", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "2", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "3", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
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
                                ButtonInterface(label: ".", interfaceSize: 50, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "0", interfaceSize: 40, width: 92, height: 90, updateUI: (value) => _updateNumber(value)),
                                ButtonInterface(label: "", interfaceSize: 30, width: 98, height: 90,
                                    iconData: const Icon(Icons.favorite, color: AppColors.black,
                                        shadows: [Shadow(
                                            offset: Offset(0,0),
                                            blurRadius:  70,
                                            color: AppColors.details)] ,
                                        size: 40),
                                    updateUI: (value) => _updateNumber(value)),
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
