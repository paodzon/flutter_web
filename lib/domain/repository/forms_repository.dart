import 'package:flutter_web/domain/entities/form.dart';

abstract class FormsRepository {
  List<FormEntity> getForms();
}
