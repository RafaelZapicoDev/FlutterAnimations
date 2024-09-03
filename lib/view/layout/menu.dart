import 'package:animations/view/pages/animated_transition.dart';
import 'package:animations/view/pages/hero_begin.dart';
import 'package:animations/view/pages/opacity.dart';
import 'package:animations/view/pages/container.dart';
import 'package:animations/view/pages/home.dart';
import 'package:animations/view/pages/staggered_animation.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: const Text("Animações implícitas"),
              children: [
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("AnimatedContainer"),
                  leading: const Icon(Icons.add_box),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContainerProperties()));
                  },
                ),
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("AnimatedOpacity"),
                  leading: const Icon(Icons.opacity),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OpacityProperties()));
                  },
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: const Text("Animações explícitas"),
              children: [
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("Hero Animation"),
                  leading: const Icon(Icons.screen_share_outlined),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HeroAnimation()));
                  },
                ),
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("Transition Animations"),
                  leading: const Icon(Icons.bookmarks_sharp),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnimatedTransition()));
                  },
                ),
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("Sttagered Animations"),
                  leading: const Icon(Icons.animation_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StaggeredAnimation()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
