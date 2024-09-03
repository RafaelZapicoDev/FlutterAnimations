import 'dart:math';

import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';

class RotationProperties extends StatefulWidget {
  const RotationProperties({super.key});

  @override
  State<StatefulWidget> createState() => RotationPropertiesState();
}

class RotationPropertiesState extends State<RotationProperties> {
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Animated Container"),
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
                  child: AnimatedRotation(
                    alignment: Alignment.center,
                    turns: turns,
                    duration: const Duration(seconds: 1),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.purpleAccent,
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
                    turns += 1; // Adjust increment for desired rotation angle
                  });
                },
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.indigoAccent)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.rotate_90_degrees_cw_sharp),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Text(
                      "Girar",
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
                        "Alguns widgets no flutter possuem uma versão pronta para animar, cuja a mudança de suas propriedades vai refletir na sua renderização, sem que haja a necessidade de configurar a fundo essas animações, como é o caso do AnimatedContainer. Uma de suas propriedades permite escolher um efeito de curva de animação, que gera diferentes efeitos de transição.",
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
