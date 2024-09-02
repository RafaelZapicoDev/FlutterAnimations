import 'dart:math';

import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';

class OpacityProperties extends StatefulWidget {
  const OpacityProperties({super.key});

  @override
  State<StatefulWidget> createState() => OpacityPropertiesState();
}

class OpacityPropertiesState extends State<OpacityProperties> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "AnimatedOpacity"),
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
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(20)),
                    ),
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
                  setState(() {
                    _visible = !_visible;
                  });
                },
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.indigoAccent)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Text(
                      "Reconstruir",
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
                        "O flutter também disponibilza opções referentes a outras propriedades, como AnimatedOpacity, que vai controlar a opacidade do widget filho com base na propriedade que lhe foi passado.",
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
