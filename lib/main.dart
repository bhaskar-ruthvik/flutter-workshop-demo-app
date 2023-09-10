import 'package:flutter/material.dart';
import 'package:workshop_app/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(brightness: Brightness.light,seedColor: Colors.teal),
        useMaterial3: true,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color.fromARGB(30, 0, 0, 0)
        )
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark,seedColor: Color.fromARGB(255, 207, 72, 108)),
        useMaterial3: true,
         bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color.fromARGB(255, 0, 0, 0)
        )
      ),
  
      home: const HomeScreen()
    );
  }
}
