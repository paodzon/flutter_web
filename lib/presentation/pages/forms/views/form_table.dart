import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web/app/config/app_colors.dart';
import 'package:flutter_web/app/config/app_text_styles.dart';
import 'package:flutter_web/presentation/controllers/forms_controller.dart';
import 'package:flutter_web/presentation/pages/forms/views/menu_button.dart';
import 'package:flutter_web/presentation/pages/forms/views/pagination/pagination.dart';
import 'package:flutter_web/presentation/pages/forms/views/status_tag.dart';
import 'package:get/get.dart';

class FormTable extends GetView<FormsController> {
  const FormTable({Key? key}) : super(key: key);

  DataTable dataTable(context) {
    return DataTable(
      horizontalMargin: 0,
      dataRowHeight: 70,
      columnSpacing: 10,
      columns: [
        DataColumn(
          label: SizedBox(
            width: MediaQuery.of(context).size.width * .3,
            child: controller.selectedForms.isNotEmpty
                ? Row(
                    children: [
                      Text(
                        '${controller.selectedForms.length > 1 ? '${controller.selectedForms.length} items' : '${controller.selectedForms.length} item'} selected',
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
                        onPressed: controller.selectedForms.isEmpty
                            ? null
                            : () {
                                controller.deleteAllSelected();
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
            child: controller.selectedForms.isEmpty
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
              child: controller.selectedForms.isEmpty
                  ? const Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  : null),
          numeric: false,
        ),
        DataColumn(
          label: SizedBox(
              child: controller.selectedForms.isEmpty
                  ? const Text(
                      "Actions",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  : null),
          numeric: false,
        ),
      ],
      rows: controller.formData
          .map(
            (form) => DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.orange50;
                  }
                  return null;
                }),
                selected: controller.selectedForms.contains(form.id),
                onSelectChanged: (b) {
                  controller.onSelectedRow(b!, form.id);
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
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.gray100,
                              onPrimary: AppColors.gray700),
                          child: const Text('Edit'),
                        ),
                        const SizedBox(width: 20),
                        MenuButton(
                          onDelete: () =>
                              controller.deleteSelectedForm(form.id),
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
        Obx(
          () => Container(
            constraints: controller.formData.isNotEmpty
                ? const BoxConstraints(minHeight: 500)
                : null,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: AppColors.gray50),
              ),
            ),
            width: double.infinity,
            child: dataTable(context),
          ),
        ),
        Obx(
          () => Container(
            constraints: controller.formData.isEmpty
                ? const BoxConstraints(minHeight: 500)
                : null,
            child: controller.formData.isEmpty
                ? InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'icons/inbox.svg',
                    ))
                : null,
          ),
        ),
        Obx(() => Container(
              padding: const EdgeInsets.only(top: 32),
              decoration: controller.formData.isEmpty
                  ? BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: AppColors.gray50),
                      ),
                    )
                  : null,
              child: Pagination(
                totalItems: 254,
                totalPages: 26,
                currentPage: controller.currentPage.value,
                pageSize: 10,
                setCurrentPage: (_) => controller.setCurrentPage(_),
              ),
            )),
      ],
    );
  }
}
