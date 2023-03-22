import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/pages/workflows/data.dart';

import 'package:flutter_web/presentation/widgets/layout.dart';
import 'package:textinput_builder/textinput_builder.dart';

class WorkflowsPage extends StatefulWidget {
  const WorkflowsPage({Key? key}) : super(key: key);

  @override
  State<WorkflowsPage> createState() => _WorkflowsPageState();
}

class _WorkflowsPageState extends State<WorkflowsPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      header: Container(),
      contentPage: Container(
        margin: const EdgeInsets.all(50),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FormBuilder(data: sampleJson, onSubmit: (val) => print(val))
        ]),
      ),
    );
  }
}
