import 'package:flutter/material.dart';
import 'package:learning/screens/parts/form.dart';

class PushWidgetD extends StatelessWidget {
  const PushWidgetD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulaire"),
        centerTitle: true,
      ),
      body: FormD(),
    );
  }
}
