import 'dart:math';

import 'package:animations/main.dart';
import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<StatefulWidget> createState() => ListAnimationState();
}

class ListAnimationState extends State<ListAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Custom List Animation"),
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
                  child: Wrap(
                    direction: Axis.vertical,
                    runSpacing: 40,
                    spacing: 20,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.ac_unit_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Item da Lista ",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.ac_unit_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Item da Lista ", style: TextStyle(fontSize: 20))
                        ],
                      ),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.ac_unit_rounded, size: 30),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Item da Lista ",
                              style: TextStyle(fontSize: 20),
                            )
                          ])
                    ]
                        .animate(interval: 500.ms)
                        .fadeIn(duration: 400.ms)
                        .slideX(delay: 100.ms, begin: 1, end: 0),
                  ),
                  /////////////////////////////////////////////////
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
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
                        "Com o  package flutter_animate também é possível criar listas animadas, sem a necessidade de lógica complicada para isso. Sendo possível combinar diferentes efeitos pra gerar uma animação personalizada.",
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
