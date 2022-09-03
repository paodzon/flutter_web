import 'package:flutter_web/data/repositories/forms_repository.dart';
import 'package:flutter_web/domain/usecases/get_forms_use_case.dart';
import 'package:flutter_web/presentation/controllers/forms_controller.dart';
import 'package:get/get.dart';

class FormsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FormsRepositoryIml());
    Get.lazyPut(() => GetFormsUseCase(Get.find<FormsRepositoryIml>()));
    Get.lazyPut(() => FormsController(Get.find()));
  }
}
