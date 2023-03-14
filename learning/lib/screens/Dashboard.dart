import 'dart:math';

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  getRandom() {
    Random random = Random();
    var number = random.nextInt(200);
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Learning".toLowerCase()),
          backgroundColor: Colors.yellow,
          centerTitle: true,
        ),
        body: Container(
          width: 200.0,
          height: 200.0,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(12.0),
          alignment: Alignment.center,
          decoration:  BoxDecoration(
              border: Border.all(color:Colors.lightBlue,width: 6.0),
              color: Colors.blue,
              // borderRadius: const BorderRadius.all(Radius.circular(10.0),),
              shape: BoxShape.circle,
              image: const DecorationImage(image: AssetImage("images/image.png"))
              ),
          // child: const Text(
          //   "TESTING",
          //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          // ),
        ));
  }
}
