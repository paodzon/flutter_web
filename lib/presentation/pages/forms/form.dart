// ignore_for_file: non_constant_identifier_names

class FormData {
  late int id;
  late String file_name;
  late String date_created;

  FormData(
      {required this.id, required this.file_name, required this.date_created});

  static List<FormData> getFormData() {
    return <FormData>[
      FormData(
          id: 123,
          file_name: "File Name Ipsum1",
          date_created: "July 12, 2022"),
      FormData(
          id: 1234,
          file_name: "File Name Ipsum2",
          date_created: "July 12, 2022"),
      FormData(
          id: 222,
          file_name: "File Name Ipsum3",
          date_created: "July 12, 2022"),
      FormData(
          id: 333,
          file_name: "File Name Ipsum4",
          date_created: "July 12, 2022"),
      FormData(
          id: 444,
          file_name: "File Name Ipsum5",
          date_created: "July 12, 2022"),
    ];
  }
}
