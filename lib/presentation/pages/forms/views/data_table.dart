import 'package:flutter/material.dart';
import '../form.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  final String title = "Data Table Flutter Demo";

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  late List<FormData> forms;
  late List<FormData> selectedForms;
  late bool sort;

  @override
  void initState() {
    sort = false;
    selectedForms = [];
    forms = FormData.getFormData();
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        forms.sort((a, b) => a.file_name.compareTo(b.file_name));
      } else {
        forms.sort((a, b) => b.file_name.compareTo(a.file_name));
      }
    }
  }

  onSelectedRow(bool selected, FormData form) async {
    setState(() {
      if (selected) {
        selectedForms.add(form);
      } else {
        selectedForms.remove(form);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedForms.isNotEmpty) {
        List<FormData> temp = [];
        temp.addAll(selectedForms);
        for (FormData form in temp) {
          forms.remove(form);
          selectedForms.remove(form);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: const Text("File Name"),
              numeric: false,
              tooltip: "This is First Name",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          const DataColumn(
            label: Text("Date Created"),
            numeric: false,
            tooltip: "This is Last Name",
          ),
        ],
        rows: forms
            .map(
              (form) => DataRow(
                  selected: selectedForms.contains(form),
                  onSelectChanged: (b) {
                    print("Onselect");
                    onSelectedRow(b!, form);
                  },
                  cells: [
                    DataCell(
                      Text(form.file_name),
                      onTap: () {
                        print('Selected ${form.file_name}');
                      },
                    ),
                    DataCell(
                      Text(form.date_created),
                    ),
                  ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: dataBody(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OutlinedButton(
                child: Text('SELECTED ${selectedForms.length}'),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OutlinedButton(
                onPressed: selectedForms.isEmpty
                    ? null
                    : () {
                        deleteSelected();
                      },
                child: const Text('DELETE SELECTED'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
