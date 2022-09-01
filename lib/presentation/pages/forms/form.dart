class FormData {
  late int id;
  late String fileName;
  late String dateCreated;
  late String status;
  late String dateEdited;
  late String editedBy;

  FormData({
    required this.id,
    required this.fileName,
    required this.dateCreated,
    required this.dateEdited,
    required this.editedBy,
    required this.status,
  });

  static List<FormData> getFormData() {
    return <FormData>[
      FormData(
          id: 123,
          fileName: "File Name Ipsum1",
          dateCreated: "July 12, 2022",
          dateEdited: 'August 12, 2022',
          editedBy: 'John D',
          status: 'Published'),
      FormData(
          id: 1234,
          fileName: "File Name Ipsum2",
          dateCreated: "July 12, 2022",
          dateEdited: 'August 12, 2022',
          editedBy: 'John D',
          status: 'Draft'),
      FormData(
          id: 222,
          fileName: "File Name Ipsum3",
          dateCreated: "July 12, 2022",
          dateEdited: 'August 12, 2022',
          editedBy: 'John D',
          status: 'Archived'),
      FormData(
          id: 333,
          fileName: "File Name Ipsum4",
          dateCreated: "July 12, 2022",
          dateEdited: 'August 12, 2022',
          editedBy: 'John D',
          status: 'Draft'),
      FormData(
        id: 444,
        fileName: "File Name Ipsum5",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Draft',
      ),
      FormData(
        id: 445,
        fileName: "File Name Ipsum6",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Draft',
      ),
      FormData(
        id: 446,
        fileName: "File Name Ipsum7",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Draft',
      ),
      FormData(
        id: 447,
        fileName: "File Name Ipsum8",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Draft',
      ),
      FormData(
        id: 448,
        fileName: "File Name Ipsum9",
        dateCreated: "July 12, 2022",
        dateEdited: 'August 12, 2022',
        editedBy: 'John D',
        status: 'Published',
      ),
      FormData(
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
