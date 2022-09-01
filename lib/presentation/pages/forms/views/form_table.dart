import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web/app/config/app_colors.dart';
import 'package:flutter_web/app/config/app_text_styles.dart';
import 'package:flutter_web/presentation/pages/forms/views/menu_button.dart';
import 'package:flutter_web/presentation/pages/forms/views/pagination/pagination.dart';
import 'package:flutter_web/presentation/pages/forms/views/status_tag.dart';
import '../form.dart';

class FormTable extends StatefulWidget {
  FormTable() : super();

  @override
  FormTableState createState() => FormTableState();
}

class FormTableState extends State<FormTable> {
  late List<FormData> forms;
  late List<FormData> selectedForms;
  late bool sort;
  var currentPage = 1;

  @override
  void initState() {
    sort = false;
    selectedForms = [];
    forms = FormData.getFormData();
    super.initState();
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

  deleteAllSelected() async {
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

  deleteSelectedForm(id) async {
    setState(() {
      forms.removeWhere((e) => e.id == id);
    });
  }

  setCurrentPage(int num) async {
    setState(() {
      currentPage = num + 1;
    });
  }

  DataTable dataTable() {
    final double width = MediaQuery.of(context).size.width;
    return DataTable(
      horizontalMargin: 0,
      dataRowHeight: 70,
      sortAscending: sort,
      sortColumnIndex: 0,
      columnSpacing: 10,
      columns: [
        DataColumn(
          label: SizedBox(
            width: selectedForms.isNotEmpty ? width * .3 : width * .3,
            child: selectedForms.isNotEmpty
                ? Row(
                    children: [
                      Text(
                        '${selectedForms.length > 1 ? '${selectedForms.length} items' : '${selectedForms.length} item'} selected',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            textStyle: AppTextStyles.body2,
                            primary: AppColors.gray100,
                            onPrimary: AppColors.gray700),
                        label: const Text('Archive'),
                        icon: Icon(
                          Icons.inbox_outlined,
                          color: AppColors.gray400,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        onPressed: selectedForms.isEmpty
                            ? null
                            : () {
                                deleteAllSelected();
                              },
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.gray100,
                            onPrimary: AppColors.gray700),
                        label: const Text('Delete'),
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: AppColors.gray400,
                        ),
                      )
                    ],
                  )
                : const Text(
                    "Form Name",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
          ),
          numeric: false,
        ),
        DataColumn(
          label: SizedBox(
            child: selectedForms.isEmpty
                ? const Text(
                    "Date Created",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                : null,
          ),
          numeric: false,
        ),
        DataColumn(
          label: SizedBox(
              child: selectedForms.isEmpty
                  ? const Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  : null),
          numeric: false,
        ),
        DataColumn(
          label: SizedBox(
              child: selectedForms.isEmpty
                  ? const Text(
                      "Actions",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  : null),
          numeric: false,
        ),
      ],
      rows: forms
          .map(
            (form) => DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.orange50;
                  }
                  return null;
                }),
                selected: selectedForms.contains(form),
                onSelectChanged: (b) {
                  onSelectedRow(b!, form);
                },
                cells: [
                  DataCell(Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        form.fileName,
                        style: TextStyle(
                            color: AppColors.orange800,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Last edited ${form.dateEdited} by ${form.editedBy}',
                        style: TextStyle(
                            color: AppColors.gray700,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      )
                    ],
                  )),
                  DataCell(
                    Text(
                      form.dateCreated,
                      style: TextStyle(
                          color: AppColors.gray700,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                  DataCell(
                    StatusTag(status: form.status),
                  ),
                  DataCell(
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.gray100,
                              onPrimary: AppColors.gray700),
                          child: const Text('Preview'),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => deleteSelectedForm(form.id),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.gray100,
                              onPrimary: AppColors.gray700),
                          child: const Text('Edit'),
                        ),
                        const SizedBox(width: 20),
                        MenuButton(
                          onDelete: () => deleteSelectedForm(form.id),
                        )
                      ],
                    ),
                  ),
                ]),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          constraints:
              forms.isNotEmpty ? const BoxConstraints(minHeight: 500) : null,
          width: double.infinity,
          child: dataTable(),
        ),
        forms.isEmpty
            ? Container(
                constraints: const BoxConstraints(minHeight: 500),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: AppColors.gray50),
                  ),
                ),
                child: Center(
                    child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset('icons/inbox.svg'))),
              )
            : const SizedBox(
                child: null,
              ),
        Container(
          height: 32,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: AppColors.gray50),
            ),
          ),
        ),
        Pagination(
          totalItems: 254,
          totalPages: 26,
          currentPage: currentPage,
          pageSize: 10,
          setCurrentPage: (_) => setCurrentPage(_),
        )
      ],
    );
  }
}
