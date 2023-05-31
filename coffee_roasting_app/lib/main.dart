import 'package:coffee_roasting_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Color.fromARGB(255, 252, 68, 15),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
