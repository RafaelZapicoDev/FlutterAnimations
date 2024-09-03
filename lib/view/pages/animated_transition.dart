import 'dart:math';

import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:animations/view/pages/container.dart';
import 'package:animations/view/pages/hero_begin.dart';
import 'package:flutter/material.dart';

class AnimatedTransition extends StatefulWidget {
  const AnimatedTransition({super.key});

  @override
  State<StatefulWidget> createState() => AnimatedTransitionState();
}

class AnimatedTransitionState extends State<AnimatedTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Animated Transitions"),
      drawer: const MenuDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          Expanded(
            flex: 2,
            child: Container(
              width: 450,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(28.0),
                  /////////////////////////////////////////////////
                  child: Icon(
                    Icons.directions_walk_sharp,
                    size: 60,
                  ),
                  /////////////////////////////////////////////////
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          SizedBox(
            width: 250,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ContainerProperties(),
                      transitionDuration: const Duration(milliseconds: 745),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.bounceOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.indigoAccent)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.animation_rounded),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Text(
                      "Animar transição",
                    ),
                  ],
                )),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          const Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: Text(
                        "Também é possível criar uma animação personalizada para fazer a transição entre as páginas, utilizando o PageRouteBuilder. Com seu parâmetro transition builder é possível especificar qualquer tipo de animação para a transição, assim como a sua curva de animação.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
