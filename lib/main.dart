import 'package:flutter/material.dart';
import 'calculatrice.dart';
import 'package:flutter/services.dart';

void main() {

  // Block the app in Portrait mode (no landscape possible)
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      // Remove Banner "debug"
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Calculatrice(),
      ),
    );
  }
}

