import 'package:animations/view/pages/custom/floating.dart';
import 'package:animations/view/pages/custom/list_custom.dart';
import 'package:animations/view/pages/implicit/animated_positioned.dart';
import 'package:animations/view/pages/explicit/animated_transition.dart';
import 'package:animations/view/pages/explicit/hero_begin.dart';
import 'package:animations/view/pages/implicit/opacity.dart';
import 'package:animations/view/pages/implicit/container.dart';
import 'package:animations/view/pages/implicit/rotation.dart';
import 'package:animations/view/pages/explicit/staggered_animation.dart';
import 'package:animations/view/pages/implicit/list_animated.dart';
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
                  title: const Text("Animated Container"),
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
                  title: const Text("Animated Opacity"),
                  leading: const Icon(Icons.opacity),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OpacityProperties()));
                  },
                ),
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("Animated Rotation"),
                  leading: const Icon(Icons.screen_rotation_alt_outlined),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RotationProperties()));
                  },
                ),
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("Animated Positioned"),
                  leading: const Icon(Icons.curtains),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnimatedPosition()));
                  },
                ),
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("Animated List"),
                  leading: const Icon(Icons.list_alt),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListAnimated()));
                  },
                ),
              ],
            ),
          ),
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
                  title: const Text("Staggered Animations"),
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
          ),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: const Text("Animações customizadas"),
              children: [
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("Floating Animation"),
                  leading: const Icon(Icons.water_drop_outlined),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FloatingAnimation()));
                  },
                ),
                ListTile(
                  hoverColor: const Color.fromARGB(255, 246, 246, 248),
                  title: const Text("Custom List Animation"),
                  leading: const Icon(Icons.list_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListAnimation()));
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
