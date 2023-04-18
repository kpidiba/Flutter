import 'package:flutter/material.dart';
import 'package:learning/screens/parts/details.dart';

enum ProductTypeEnum { Downloadable, Deliverable }

class FormD extends StatefulWidget {
  const FormD({super.key});

  @override
  State<FormD> createState() => _FormDState();
}

class _FormDState extends State<FormD> {
  var _data;
  bool? _checkBoxList = true;
  final _dataController = TextEditingController();
  bool? _checkBox = true;
  ProductTypeEnum? _productTypeEnum;
  final _dropDownList = ["Small", "Medium", "Large", "XLarge"];
  String _selectVal = "Small";
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

  _FormDState() {
    _selectVal = _dropDownList[0];
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
            checkColor: Colors.black,
            activeColor: Colors.blue,
            value: _checkBox,
            onChanged: (value) => setState(() {
              print("value");
              _checkBox = value;
            }),
          ),
          CheckboxListTile(
              contentPadding: const EdgeInsets.all(0.0),
              tileColor: Colors.black26,
              title: const Text("you are a human"),
              tristate: true,
              controlAffinity: ListTileControlAffinity.leading,
              value: _checkBoxList,
              onChanged: (value) => setState(() {
                    _checkBoxList = value;
                  })),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    value: ProductTypeEnum.Deliverable,
                    groupValue: _productTypeEnum,
                    title: Text(ProductTypeEnum.Deliverable.name),
                    onChanged: (value) => setState(() {
                          _productTypeEnum = value;
                        })),
              ),
              Expanded(
                child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    value: ProductTypeEnum.Downloadable,
                    groupValue: _productTypeEnum,
                    title: Text(ProductTypeEnum.Downloadable.name),
                    onChanged: (value) => setState(() {
                          _productTypeEnum = value;
                        })),
              ),
            ],
          ),
          DropdownButton(
              value: _selectVal,
              items: _dropDownList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _selectVal = val as String;
                });
              }),
          DropdownButtonFormField(
              value: _selectVal,
              items: _dropDownList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _selectVal = val as String;
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.deepPurple,
              ),
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Prize input",
                  prefixIcon: Icon(
                    Icons.accessibility_new_rounded,
                    color: Colors.green,
                  ))),
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
