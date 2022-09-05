import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/pages/settings/views/custom_textfield.dart';
import 'package:flutter_web/presentation/pages/settings/views/panel_fields.dart';
import './sampleJson.dart';

class BasicDragDrop extends StatefulWidget {
  const BasicDragDrop({Key? key}) : super(key: key);

  @override
  _BasicDragDropState createState() => _BasicDragDropState();
}

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

class _BasicDragDropState extends State<BasicDragDrop> {
  bool _isDropped = false;
  String dragData = 'Text has been dropped';
  List draggedFields = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void submitData() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: fields
                  .map(
                    (field) => Draggable<Map>(
                      // Data is the value this Draggable stores.
                      data: field,
                      feedback: const SizedBox(
                        width: 290,
                        child:
                            Center(child: Icon(Icons.compare_arrows_outlined)),
                      ),
                      childWhenDragging: SizedBox(
                        width: 290,
                        child: Center(
                          child: PanelFields(
                            field: field['label'],
                          ),
                        ),
                      ),
                      onDragStarted: () {
                        //showSnackBarGlobal(context, 'Drag started');
                      },
                      child: SizedBox(
                        width: 290,
                        child: Center(
                          child: PanelFields(
                            field: field['label'],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            DragTarget<Map>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  height: 500,
                  width: 300,
                  child: Form(
                    key: formKey,
                    child: _isDropped
                        ? Column(
                            children: [
                              Column(
                                children: draggedFields
                                    .map((field) => CustomTextfield(
                                          fieldName: field['label'],
                                          type: field['type'],
                                          placeholder: field['placeholder'],
                                        ))
                                    .toList(),
                              ),
                              ElevatedButton(
                                  onPressed: () => submitData(),
                                  child: Text('Submit'))
                            ],
                          )
                        : const Text('Draggable Target'),
                  ),
                );
              },
              onAccept: (data) {
                setState(() {
                  draggedFields.add(data);
                  showSnackBarGlobal(context, 'Dropped successfully!');
                  _isDropped = true;
                });
              },
              onLeave: (data) {
                showSnackBarGlobal(context, 'Missed');
              },
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBarGlobal(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      textScaleFactor: 2,
    )));
  }
}
