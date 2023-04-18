import 'package:flutter/material.dart';
import 'package:learning/screens/parts/details.dart';

class FormD extends StatefulWidget {
  const FormD({super.key});

  @override
  State<FormD> createState() => _FormDState();
}

class _FormDState extends State<FormD> {
  var _data;
  final _dataController = TextEditingController();
  bool? _checkBox = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _dataController.addListener(_updateData);
  // }

  @override
  void dispose() {
    super.dispose();
    _dataController.dispose();
  }

  void _updateData() {
    setState(() {
      _data = _dataController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulaire"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          const TextField(
            decoration: InputDecoration(
                hintText: "Product name", icon: Icon(Icons.verified_user)),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          TextFormField(
            controller: _dataController,
            decoration: const InputDecoration(
                labelText: "Product name",
                prefixIcon: Icon(Icons.verified_user),
                // icon: Icon(Icons.verified_user),
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "value equals ${_dataController.text}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Checkbox(
            value: _checkBox,
            onChanged: (value) => setState(() {
              print("value");
              _checkBox = value;
            }),
          ),
          myBtn(context)
        ]),
      )),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailsD(
              dataValue: _dataController.text,
            );
          }));
        },
        child: Text(
          "Submit Form".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
