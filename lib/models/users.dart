import 'package:mongo_dart/mongo_dart.dart';

class User {
  final ObjectId id;
  final String firstName;
  final String lastName;
  final String login;
  final String password; //work on password hashing
  final String email;
  final bool verification;

  const User({required this.id, required this.firstName, required this.lastName, required this.login, required this.password, required this.email, required this.verification});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'login': login,
      'password': password,
      'email': email,
      'verification': verification,
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        login = map['login'],
        password = map['password'],
        email = map['email'],
        verification = map['verification'];

}