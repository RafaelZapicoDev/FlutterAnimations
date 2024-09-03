import 'dart:math';

import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';

class AnimatedPosition extends StatefulWidget {
  const AnimatedPosition({super.key});

  @override
  State<StatefulWidget> createState() => AnimatedPositionState();
}

class AnimatedPositionState extends State<AnimatedPosition> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Animated Positioned"),
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
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  fit: StackFit.loose,
                  children: [
                    Positioned(
                        width: 150,
                        height: 150,
                        child: Image.asset("mortis.png")),
                    AnimatedPositioned(
                      top: selected ? -200 : 55,
                      curve: Curves.fastOutSlowIn,
                      width: 200,
                      height: 200,
                      duration: const Duration(milliseconds: 500),
                      child: const ColoredBox(
                        color: Colors.green,
                      ),
                    ),
                  ],
                )),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          SizedBox(
            width: 250,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.indigoAccent)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.dark_mode_outlined),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Text(
                      "Creature of the night",
                    ),
                  ],
                )),
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
                        "Assim como o container no container, o positioned também possui uma versão animada, o jeito de programar suas mudanças são quase idênticas, e é otimo pra fazer efeitos de revelação",
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
