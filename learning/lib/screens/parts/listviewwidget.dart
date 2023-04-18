import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  String title, subTitle;
  IconData leadingIcon, trailingIcon;
  Color listTitleColor, iconColor;

  ListViewWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.leadingIcon = Icons.label,
    this.trailingIcon = Icons.add_a_photo,
    required this.listTitleColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: ListTile(
        tileColor: listTitleColor,
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(leadingIcon),
        trailing: Icon(trailingIcon),
        iconColor: iconColor,
      ),
    );
  }
}
