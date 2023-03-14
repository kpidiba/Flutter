import 'dart:math';

import 'package:flutter/material.dart';

class Dcontainer extends StatelessWidget {
  const Dcontainer({super.key});
  getRandom() {
    Random random = Random();
    var number = random.nextInt(200);
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu_book),
          title: const Text("Menu Book"),
          backgroundColor: Colors.purple,
          flexibleSpace:  const Image(image:  NetworkImage("https://miro.medium.com/v2/resize:fit:1400/format:webp/0*vQwPKDYJVQr0dEKm.jpeg"),fit: BoxFit.cover,),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc,
                  size: 35,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 35,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.leaderboard,
                  size: 35,
                ))
          ],
        ),
        body: Container(
          width: 350.0,
          height: 250.0,
          margin: const EdgeInsets.all(50.0),
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 6.0),
              color: Colors.blue,
              // borderRadius: const BorderRadius.all(Radius.circular(10.0),),
              shape: BoxShape.circle,
              image:
                  const DecorationImage(image: AssetImage("images/image.png")),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade900,
                    blurRadius: 7,
                    spreadRadius: 5,
                    offset: const Offset(4, 4))
              ]),
          // child: const Text(
          //   "TESTING",
          //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          // ),
        ));
  }
}
