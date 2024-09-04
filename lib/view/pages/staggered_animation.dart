import 'dart:math';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';

class StaggeredAnimation extends StatefulWidget {
  const StaggeredAnimation({super.key});

  @override
  State<StatefulWidget> createState() => StaggeredAnimationState();
}

class StaggeredAnimationState extends State<StaggeredAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _starScaleAnimations;
  late List<Animation<double>> _starJumpAnimations;
  late List<Animation<double>> _starRotationAnimations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1900),
    );

    _starScaleAnimations = List.generate(5, (index) {
      final start = index * 0.2;
      final end = start + 0.2;
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _starJumpAnimations = List.generate(5, (index) {
      final start = index * 0.1 + 0.2;
      final end = start + 0.4;

      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: -40)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: -40, end: 0)
              .chain(CurveTween(curve: Curves.easeOutSine)),
          weight: 50,
        ),
      ]).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _starRotationAnimations = List.generate(5, (index) {
      final start = index * 0.2;
      final end = start + 0.2;
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Staggered Animations"),
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
      ),
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
                  padding: const EdgeInsets.all(18.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(5, (index) {
                          return const Icon(
                            Icons.star_rounded,
                            size: 60,
                            color: Color.fromARGB(255, 138, 162, 173),
                          );
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(5, (index) {
                          return AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Transform.translate(
                                offset:
                                    Offset(0, _starJumpAnimations[index].value),
                                child: Transform.scale(
                                  scale: _starScaleAnimations[index].value,
                                  child: Transform.rotate(
                                    angle:
                                        _starRotationAnimations[index].value *
                                            4 *
                                            pi,
                                    child: const Icon(
                                      Icons.star_rounded,
                                      size: 60,
                                      color: Colors
                                          .amber, // Cor das estrelas animadas
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
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
                _animationController.forward(from: 0.0);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.indigoAccent,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow_rounded),
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Text("Play"),
                ],
              ),
            ),
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Text(
                      "Animações Staggered ou ligadas são uma possibilidade de executar várias animações sequencialmente, permitindo que elas comecem em momentos diferentes mas de forma dinâmica, criando um efeito visual de onda.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
