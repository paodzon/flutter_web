import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web/app/responsive.dart';

class FormsTable extends StatefulWidget {
  const FormsTable({Key? key}) : super(key: key);

  @override
  State<FormsTable> createState() => _FormsTableState();
}

class _FormsTableState extends State<FormsTable> {
  List<Map<String, dynamic>> myList = [
    {
      'id': 123,
      'file_name': 'File Name Ipsum',
      'date_created': 'July 12, 2022'
    },
    {
      'id': 535,
      'file_name': 'File Name Ipsum2',
      'date_created': 'July 12, 2022'
    },
    {
      'id': 232,
      'file_name': 'File Name Ipsum3',
      'date_created': 'July 12, 2022'
    },
    {
      'id': 655,
      'file_name': 'File Name Ipsum4',
      'date_created': 'July 12, 2022'
    },
    {
      'id': 343,
      'file_name': 'File Name Ipsum5',
      'date_created': 'July 12, 2022'
    },
    {
      'id': 877,
      'file_name': 'File Name Ipsum6',
      'date_created': 'July 12, 2022'
    },
    {
      'id': 635,
      'file_name': 'File Name Ipsum7',
      'date_created': 'July 12, 2022'
    },
    {
      'id': 786,
      'file_name': 'File Name Ipsum8',
      'date_created': 'July 12, 2022'
    }
  ];

  List<dynamic> selected = List<bool>.generate(1000, (int index) => false);

  @override
  Widget build(BuildContext context) {
    var checkList = selected.where((e) => e == true).toList();
    var selectedItems = [];

    final double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: SizedBox(
                width: Responsive.isDesktop(context) ? width * .3 : width * .7,
                child: checkList.isEmpty
                    ? const Text('File Name')
                    : Row(children: [
                        Text('${checkList.length.toString()} item Selected.'),
                        const SizedBox(width: 20),
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.inbox),
                            label: Text('Archive')),
                        const SizedBox(width: 20),
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                            label: Text('Delete')),
                      ]),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: width * .2,
                child: checkList.isEmpty ? const Text('Date Created') : null,
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: width * .2,
                child: checkList.isEmpty ? const Text('Actions') : null,
              ),
            ),
          ],
          rows: myList
              .map((item) => DataRow(
                      color: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return const Color(0xffFDF4E3);
                        }
                        return null;
                      }),
                      selected: selected[item['id']],
                      onSelectChanged: (bool? value) {
                        setState(() {
                          selected[item['id']] = value!;
                        });
                      },
                      cells: <DataCell>[
                        DataCell(Text(item['file_name'])),
                        DataCell(Text(item['date_created'])),
                        DataCell(
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Preview'),
                                style: ElevatedButton.styleFrom(),
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Edit'),
                              )
                            ],
                          ),
                        )
                      ]))
              .toList(),
        ),
      ),
    );
  }
}
