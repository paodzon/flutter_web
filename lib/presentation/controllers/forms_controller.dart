import 'package:flutter_web/domain/usecases/get_forms_use_case.dart';
import 'package:get/get.dart';

class FormsController extends GetxController {
  FormsController(this._getFormsUseCase);
  final GetFormsUseCase _getFormsUseCase;

  RxString statusValue = 'Status'.obs;
  RxString typeValue = 'Type'.obs;
  RxInt currentPage = 1.obs;
  RxList formData = [].obs;
  RxList selectedForms = [].obs;

  @override
  onInit() async {
    formData.value = await _getFormsUseCase.call();
    super.onInit();
  }

  filterByStatus(String value) async {
    statusValue.value = value;
  }

  filterByType(String value) async {
    typeValue.value = value;
  }

  onSelectedRow(bool selected, id) async {
    if (selected) {
      selectedForms.add(id);
    } else {
      selectedForms.remove(id);
    }
  }

  deleteAllSelected() async {
    if (selectedForms.isNotEmpty) {
      List temp = [];
      temp.addAll(selectedForms);
      for (int id in temp) {
        formData.removeWhere((element) => element.id == id);
        selectedForms.remove(id);
      }
    }
  }

  deleteSelectedForm(id) async {
    formData.removeWhere((e) => e.id == id);
    selectedForms.remove(id);
  }

  setCurrentPage(int num) async {
    currentPage.value = num + 1;
  }
}
