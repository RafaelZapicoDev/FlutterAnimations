import 'package:animations/view/pages/implicit/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() async {
  Animate.restartOnHotReload = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Animações ",
      home: ContainerProperties(),
      debugShowCheckedModeBanner: false,
    );
  }
}
