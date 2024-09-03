import 'dart:math';

import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';

class TextAnimations1 extends StatefulWidget {
  const TextAnimations1({super.key});

  @override
  State<StatefulWidget> createState() => TextAnimations1State();
}

class TextAnimations1State extends State<TextAnimations1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Animated Texts 1"),
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
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.deepOrangeAccent,
                    )
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
                onPressed: null,
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
