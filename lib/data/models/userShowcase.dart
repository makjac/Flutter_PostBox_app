// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: file_names

class UserShowcase {
  int? userID;
  String? login;
  String? firstName;
  String? surname;
  String? email;
  String? phone;

  UserShowcase({
    this.userID,
    this.login,
    this.firstName,
    this.surname,
    this.email,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'login': login,
      'firstName': firstName,
      'surname': surname,
      'email': email,
      'phone': phone,
    };
  }

  factory UserShowcase.fromMap(Map<String, dynamic> map) {
    return UserShowcase(
      userID: map['user_id'] != null ? map['user_id'] as int : null,
      login: map['username'] != null ? map['username'] as String : null,
      firstName: map['name'] != null ? map['name'] as String : null,
      surname: map['surname'] != null ? map['surname'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserShowcase.fromJson(String source) =>
      UserShowcase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserShowcase(userID: $userID, login: $login, firstName: $firstName, surname: $surname, email: $email, phone: $phone)';
  }
}
