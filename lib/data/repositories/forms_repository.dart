import 'package:flutter_web/data/model/form_model.dart';
import 'package:flutter_web/domain/repository/forms_repository.dart';

class FormsRepositoryIml extends FormsRepository {
  @override
  getForms() async {
    return FormModel.getFormModel();
  }
}
