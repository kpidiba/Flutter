import 'package:flutter/material.dart';

class Tstateless extends StatelessWidget {
  const Tstateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HELLO WORLD"),
      ),
      body: Tstatefull(),
    );
  }
}

class Tstatefull extends StatefulWidget {
  const Tstatefull({super.key});

  @override
  State<Tstatefull> createState() => _TstatefullState();
}

class _TstatefullState extends State<Tstatefull> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Nike Icons"),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  liked = !liked;
                });
              },
              icon: liked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_outline)),
        )
      ],
    );
    ;
  }
}
