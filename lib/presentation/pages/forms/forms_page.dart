import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';
import 'package:flutter_web/presentation/controllers/forms_controller.dart';
import 'package:flutter_web/presentation/pages/forms/views/dropdown.dart';
import 'package:flutter_web/presentation/pages/forms/views/form_table.dart';
import 'package:flutter_web/presentation/pages/forms/views/header.dart';
import 'package:flutter_web/presentation/widgets/layout.dart';
import 'package:get/get.dart';

class FormsPage extends GetView<FormsController> {
  const FormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> statusDropdown = ['Status', 'Published', 'Draft', 'Archived'];
    List<String> typeDropdown = ['Type', 'Type2'];
    return Layout(
      header: const Header(),
      contentPage: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Dropdown(
                          selectValue: (_) => controller.filterByType(_),
                          values: typeDropdown,
                          selected: controller.typeValue.value,
                        )),
                    const SizedBox(width: 24),
                    Obx(
                      () => Dropdown(
                        selectValue: (_) => controller.filterByStatus(_),
                        values: statusDropdown,
                        selected: controller.statusValue.value,
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Build Form'),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      primary: AppColors.orange800),
                )
              ],
            ),
            const SizedBox(height: 32),
            FormTable()
          ],
        ),
      ),
    );
  }
}
