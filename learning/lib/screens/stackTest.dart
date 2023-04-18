import 'package:flutter/material.dart';

class StackTest extends StatelessWidget {
  const StackTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LISTVIEW"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              color: Colors.green,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

class StackImage extends StatelessWidget {
  const StackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HOME")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/image.png"), fit: BoxFit.cover)),
          child: Stack(
            children: const [
              Text(
                "Data editor",
                style: TextStyle(color: Colors.yellow, fontSize: 18),
              ),
              Positioned(
                top: 15.0,
                child: Text(
                  "The art of image",
                  style: TextStyle(color: Colors.yellow, fontSize: 22),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 20.0,
                child: Text(
                  "Learn to make a perfect image",
                  style: TextStyle(color: Colors.yellow, fontSize: 16),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Text(
                  "Coding image",
                  style: TextStyle(color: Colors.yellow, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
