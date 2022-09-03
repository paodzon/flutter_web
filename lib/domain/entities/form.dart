class FormEntity {
  final int id;
  final String fileName;
  final String dateCreated;
  final String status;
  final String dateEdited;
  final String editedBy;

  FormEntity(this.id, this.fileName, this.dateCreated, this.dateEdited,
      this.status, this.editedBy);
}
