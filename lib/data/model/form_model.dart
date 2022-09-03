import 'package:flutter_web/domain/entities/form.dart';

class FormModel extends FormEntity {
  FormModel(
      {required int id,
      required String fileName,
      required String dateCreated,
      required String dateEdited,
      required String editedBy,
      required String status})
      : super(id, fileName, dateCreated, dateEdited, status, editedBy);

  static List<FormModel> getFormModel() {
    return <FormModel>[
      FormModel(
          id: 123,
          fileName: "File Name Ipsum1",
          dateCreated: "July 12, 2022",
          dateEdited: 'August 12, 2022',
          editedBy: 'John D',
          status: 'Published'),
      FormModel(
          id: 1234,
          fileName: "File Name Ipsum2",
          dateCreated: "July 12, 2022",
          dateEdited: 'August 12, 2022',
          editedBy: 'John D',
          status: 'Draft'),
      FormModel(
          id: 222,
          fileName: "File Name Ipsum3",
          dateCreated: "July 12, 2022",
          dateEdited: 'August 12, 2022',
          editedBy: 'John D',
          status: 'Archived'),
      FormModel(
          id: 333,
          fileName: "File Name Ipsum4",
          dateCreated: "July 12, 2022",
          dateEdited: 'August 12, 2022',
          editedBy: 'John D',
          status: 'Draft'),
      FormModel(
        id: 444,
        fileName: "File Name Ipsum5",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Draft',
      ),
      FormModel(
        id: 445,
        fileName: "File Name Ipsum6",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Draft',
      ),
      FormModel(
        id: 446,
        fileName: "File Name Ipsum7",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Draft',
      ),
      FormModel(
        id: 447,
        fileName: "File Name Ipsum8",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Draft',
      ),
      FormModel(
        id: 448,
        fileName: "File Name Ipsum9",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Published',
      ),
      FormModel(
        id: 449,
        fileName: "File Name Ipsum10",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Archived',
      ),
    ];
  }
}
