import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/widgets/layout.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        contentPage: Container(
      child: Text('Application Page'),
    ));
  }
}
