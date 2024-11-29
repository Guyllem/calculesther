import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Bonjour",
        style: TextStyle(
          fontSize: 60,
        ),
      ),
    );
  }
}
