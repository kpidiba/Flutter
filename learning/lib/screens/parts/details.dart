import 'package:flutter/material.dart';

class DetailsD extends StatelessWidget {
  DetailsD({super.key, required this.dataValue});
  String dataValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details $dataValue"),
      ),
      body: const Center(
        child: Text("Details Page"),
      ),
    );
  }
}
