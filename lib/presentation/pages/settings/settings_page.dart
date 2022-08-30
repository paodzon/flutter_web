import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/pages/forms/views/data_table.dart';
import 'package:flutter_web/presentation/widgets/layout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      contentPage: Container(
        child: DataTableDemo(),
      ),
    );
  }
}
