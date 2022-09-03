import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';
import 'package:flutter_web/presentation/pages/workflows/views/number_pagination.dart';
import 'package:flutter_web/presentation/widgets/layout.dart';

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
          NumberPaginator(
            numberPages: 50,
            buttonShape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            buttonUnselectedForegroundColor: AppColors.gray700,
            buttonSelectedBackgroundColor: const Color(0xffF7921E),
            onPageChange: (int index) {
              // handle page change...
            },
          )
        ]),
      ),
    );
  }
}
