import 'package:animations/view/pages/home.dart';
import 'package:flutter/material.dart';

void main() async {
  //inicializando com o firebase

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Animações ",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
