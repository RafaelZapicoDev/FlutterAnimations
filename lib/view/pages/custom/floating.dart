import 'dart:math';

import 'package:animations/main.dart';
import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FloatingAnimation extends StatefulWidget {
  const FloatingAnimation({super.key});

  @override
  State<StatefulWidget> createState() => FloatingAnimationState();
}

class FloatingAnimationState extends State<FloatingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Floating Animation"),
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  /////////////////////////////////////////////////
                  child: Column(
                    children: [
                      const Text(
                        "🦐",
                        style: TextStyle(
                            fontSize: 180, color: Colors.deepOrangeAccent),
                      )
                          .animate(
                            onPlay: (controller) => controller.repeat(),
                          )
                          .moveY(
                              begin: -25,
                              end: 15,
                              curve: Curves.easeInOut,
                              duration: 1000.ms)
                          .then()
                          .moveY(begin: 15, end: -25, curve: Curves.easeInOut),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 180,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 137, 162, 175),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(150, 15))),
                        ),
                      )
                          .animate(
                            onPlay: (controller) => controller.repeat(),
                          )
                          .scaleX(
                              begin: 1.2,
                              end: .8,
                              curve: Curves.easeInOut,
                              duration: 1000.ms)
                          .then()
                          .scaleX(
                            begin: 0.8,
                            end: 1.2,
                            curve: Curves.easeInOut,
                          ),
                    ],
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
                    onPressed: () {},
                    style: const ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.indigoAccent)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.recycling),
                        Padding(padding: EdgeInsets.only(right: 20)),
                        Text(
                          "Balançando",
                        ),
                      ],
                    ))
                .animate(onPlay: (c) => c.repeat())
                .shimmer(
                    delay: 3000.ms,
                    duration: 500.ms,
                    color: const Color.fromARGB(255, 102, 124, 248))
                .shakeX(hz: 5),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 40)),
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
                        "Flutuação utilizando o packageflutter_animate",
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
