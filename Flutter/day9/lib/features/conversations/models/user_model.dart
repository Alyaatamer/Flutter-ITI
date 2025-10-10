class UserModel {
  final String uid;
  final String email;
  final String phone;
  final String age;
  final String name;

  UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    required this.age,
    required this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    uid: map['uid'],
    email: map['email'],
    phone: map['phone'],
    age: map['age'],
    name: map['name'],
  );
}