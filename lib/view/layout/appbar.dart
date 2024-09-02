import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String nome;

  CustomAppBar({super.key, required this.nome})
      : super(
            backgroundColor: Colors.indigoAccent,
            foregroundColor: Colors.white,
            title: Text(nome),
            centerTitle: true,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }));
}
