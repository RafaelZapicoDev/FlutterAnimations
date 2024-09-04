import 'package:animations/view/layout/appbar.dart';
import 'package:animations/view/layout/menu.dart';
import 'package:flutter/material.dart';

class ListAnimated extends StatefulWidget {
  const ListAnimated({super.key});

  @override
  State<StatefulWidget> createState() => ListAnimatedState();
}

class ListAnimatedState extends State<ListAnimated> {
  final List<String> _items = [];

  void _addItem() {
    if (_key.currentState != null) {
      _items.insert(0, "Item ${_items.length + 1}");
      _key.currentState!
          .insertItem(0, duration: const Duration(milliseconds: 200));
    }
  }

  void _removeItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(index, (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(5),
            elevation: 10,
            color: Colors.pinkAccent,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                "Removido",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        );
      }, duration: const Duration(milliseconds: 200));
      _items.removeAt(index);
    }
  }

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 206, 206),
      appBar: CustomAppBar(nome: "Animated List "),
      drawer: const MenuDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          Expanded(
            flex: 2,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: 450,
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: _items.isEmpty
                    ? const Text("A lista está vazia",
                        style: TextStyle(fontSize: 16))
                    : AnimatedList(
                        key: _key,
                        initialItemCount: _items.length,
                        itemBuilder: (context, index, animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            key: UniqueKey(),
                            child: Card(
                              margin: const EdgeInsets.all(5),
                              elevation: 10,
                              color: Colors.green,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(10),
                                title: Text(
                                  _items[index],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                leading: IconButton(
                                  onPressed: () => _removeItem(index),
                                  icon: const Icon(
                                    Icons.remove_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          SizedBox(
            width: 250,
            height: 60,
            child: ElevatedButton(
              onPressed: _addItem,
              style: const ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                backgroundColor: WidgetStatePropertyAll(Colors.indigoAccent),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_rounded),
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Text("Adicionar"),
                ],
              ),
            ),
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Text(
                      "O flutter também nos disponibiliza uma lista animada, que oferece animações diferentes para entrada e saída de itens. Também é possível fazer uma combinação de Animated Containers e Animated Lists para criar efeitos mais dinâmicos.",
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
