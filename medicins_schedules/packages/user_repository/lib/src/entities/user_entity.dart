import '../models/models.dart';

class MyUserEntity {
  String id;
  String name;
  String email;
  DateTime birthday;
  MyUserRole role;

  MyUserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.birthday,
    required this.role,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'birthday': birthday,
      'role': role,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc["id"],
      name: doc['name'],
      email: doc['emaill'],
      birthday: doc['birthday'],
      role: doc['role'],
    );
  }
}
