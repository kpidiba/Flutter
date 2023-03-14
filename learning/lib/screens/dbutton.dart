import 'package:flutter/material.dart';

class Dbutton extends StatelessWidget {
  const Dbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning".toLowerCase()),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding:const EdgeInsets.all(20),
              fixedSize: const Size(300, 70),
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              textStyle:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //NOTE: shadow
              elevation: 15,
              shadowColor: Colors.blue,
              // NOTE:border
              side: const BorderSide(color: Colors.red, width: 10),
              alignment: Alignment.center,
              shape: const StadiumBorder()),
          icon: const Icon(Icons.ac_unit),
          label: const Text("Man with a mission"),
        ),
      ),
    );
  }
}
