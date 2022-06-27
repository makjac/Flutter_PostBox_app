// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  final String login;
  final String passwd;
  final String name;
  final String surname;
  final String phone;
  final String email;

  RegisterModel({
    required this.login,
    required this.passwd,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'passwd': passwd,
      'name': name,
      'surname': surname,
      'phone': phone,
      'email': email,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      login: map['login'] as String,
      passwd: map['passwd'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(login: $login, passwd: $passwd, name: $name, surname: $surname, phone: $phone, email: $email)';
  }
}
