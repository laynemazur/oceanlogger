import 'package:mongo_dart/mongo_dart.dart';

//for user login, uses username and password as a model
//as of 7/14 currently not in use, delete if never used
class UserLogin {
  final String login;
  final String password; //work on password hashing

  const UserLogin({required this.login, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
    };
  }

  UserLogin.fromMap(Map<String, dynamic> map)
      : login = map['login'],
        password = map['password'];


}