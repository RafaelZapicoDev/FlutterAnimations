import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Animações"),
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
                  child: Text(
                    "Esse projeto foi criado para aprender / ensinar animações em flutter, cada um dos itens do menu lateral representa um tipo de animação possível em flutter.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          const SizedBox(
            width: 250,
            height: 60,
            child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.indigoAccent)),
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.thumb_up_alt),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Text(
                      "Tá certo",
                    ),
                  ],
                )),
          ),
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
              )),
        ],
      ),
    );
  }
}
