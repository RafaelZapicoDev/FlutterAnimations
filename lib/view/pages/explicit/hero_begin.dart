import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:animations/view/pages/explicit/hero_end.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<StatefulWidget> createState() => HeroAnimationState();
}

class HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Hero Begin"),
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
                        width: 200,
                        height: 200,
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
                          const HeroEnd(),
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
                        " A animação Hero no flutter identifica dois elementos em páginas diferentes e liga eles através de uma tag, causando a impressão que ele transicionou de aba junto com o usuário. Ao clicar no botão navegar, nota-se que o usuário é enviado para outra página, mas a imagem possui um efeito de aumentar. Esse tipo de animação tabém pode ser utilizada com outros tipos de widget, como o container.",
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
