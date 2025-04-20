import '../entities/entities.dart';

class MyUser {
  String id;
  String name;
  String email;
  DateTime birthday;
  MyUserRole role;

  MyUser({
    required this.id,
    required this.name,
    required this.email,
    required this.birthday,
    required this.role,
  });

  static final empty = MyUser(
    id: "",
    name: "",
    email: "",
    birthday: DateTime.now(),
    role: MyUserRole.dependent,
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      name: name,
      email: email,
      birthday: birthday,
      role: role,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      birthday: entity.birthday,
      role: entity.role,
    );
  }

  @override
  String toString() {
    return 'MyUser: $id, $email, $name, $birthday, $role';
  }
}

enum MyUserRole { dependent, caregiver }
