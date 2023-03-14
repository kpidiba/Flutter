import 'package:flutter/material.dart';
import 'package:learning/screens/Dashboard.dart';
import 'package:learning/screens/dButton.dart';
import 'package:learning/screens/dContainer.dart';

void main() => runApp(const Test());

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Learning",
      themeMode: ThemeMode.system,
      home: Dcontainer()
    );
  }
}
