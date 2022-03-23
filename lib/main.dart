import 'package:cocktailme/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail Me',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 24.0, fontFamily: 'Roboto', color: Color.fromRGBO(
              255, 255, 255, 1)),
        )

      ),
      home: const MainScreen(),
    );
  }
}
