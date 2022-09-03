import 'package:flutter_web/domain/repository/forms_repository.dart';

class GetFormsUseCase {
  final FormsRepository formsRepository;

  GetFormsUseCase(this.formsRepository);

  Future call() async {
    return formsRepository.getForms();
  }
}
