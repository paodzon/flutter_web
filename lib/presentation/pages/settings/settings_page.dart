import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/widgets/layout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(header: Container(), contentPage: Text('Settings'));
  }
}
