class User {
  final String id;
  final String name;
  final String age;

  User({required this.id, required this.name, required this.age});

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'age': age};

  static User fromJson(Map<String, dynamic> json) =>
      User(id: json['id'], name: json['name'], age: json['age']);
}
