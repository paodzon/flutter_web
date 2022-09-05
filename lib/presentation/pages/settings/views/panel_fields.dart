import 'package:flutter/material.dart';

class PanelFields extends StatelessWidget {
  final String field;
  const PanelFields({Key? key, required this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      margin: const EdgeInsets.only(bottom: 20),
      color: Colors.white,
      child: ListTile(
        leading: const Icon(Icons.add_box),
        title: Text(field),
      ),
    );
  }
}
