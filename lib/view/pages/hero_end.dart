import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';

import 'package:animations/view/pages/hero_prologue.dart';
import 'package:flutter/material.dart';

class HeroEnd extends StatefulWidget {
  const HeroEnd({super.key});

  @override
  State<StatefulWidget> createState() => HeroEndState();
}

class HeroEndState extends State<HeroEnd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Hero End"),
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
                  child: Hero(
                      tag: 'exemplo',
                      child: Image.asset(
                        'finland.jpg',
                        width: 600,
                        height: 400,
                      )),
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
                          const HeroPrologue(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
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
                    Icon(Icons.navigate_next_rounded),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Text(
                      "Navegar",
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
                        "Outro ponto interessante é que não precisa ser exatamente o mesmo widget ou mídia, o efeito de transição também se torna um efeito de troca ligada. Ao clicar no botão, a imagem transiciona da Finlândia para a Tailândia, navegando para a próxima página.",
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
