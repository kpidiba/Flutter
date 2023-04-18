import 'package:flutter/material.dart';
import 'package:learning/screens/parts/listviewwidget.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Widget"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListViewWidget(
            title: "Hello world",
            subTitle: "b13 second man",
            listTitleColor: Colors.grey,
            iconColor: Colors.yellow,
          )
        ],
      ),
    );
  }
}
