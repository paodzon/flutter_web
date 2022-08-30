import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/pages/forms/views/customradio_button.dart';
import 'package:flutter_web/presentation/pages/forms/views/dropdown.dart';
import 'package:flutter_web/presentation/pages/forms/views/forms_table.dart';
import 'package:flutter_web/presentation/pages/forms/views/sample.dart';
import 'package:flutter_web/presentation/widgets/layout.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        contentPage: Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Dropdown(),
                SizedBox(width: 24),
                Dropdown(),
              ],
            ),
            OutlinedButton(
                onPressed: () {},
                child: Row(
                  children: const [Text('Export'), Icon(Icons.arrow_drop_down)],
                ))
          ],
        ),
        Container(
          color: Colors.white,
          child: CustomRadioButton(),
        ),
        FormsTable()
      ]),
    ));
  }
}
