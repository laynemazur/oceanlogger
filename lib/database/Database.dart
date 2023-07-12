import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';
import '../../utils/constants.dart';
import '../../models/users.dart';
import '../../models/loginverification.dart';

// db.collection("OceanLogger.FishDB");
// db.collection("OceanLogger.Users");
// db.collection("OceanLogger.ScubaLogger");
// db.collection("OceanLogger.FishLogger");
// ^ these are collections to be used, may not need to use them in this file

//use: import 'Database.dart'; at top of any files using DB.

class MongoDB {
  static var db, userDB;


  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open;
    userDB = db.collection(USER_COLLECTION);
  }

  /*CREATE user
  static insert(User user) async {
    await userDB.insertAll([user.toMap()]);
  } */

  /*READ ALL users (unimplemented in code -lay)
  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final users = await userDB.find().toList();
      return users;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  } */

  //Login Verification
  static Future<bool> authenticateUser(String login, String password) async {

    //final query = where.eq('login', 'jdoe').eq('password', 'COP4331iscool');
    final result = await userDB.find('login', 'jdoe');

    await db.close();

    return result != null;
  }


  /*UPDATE user
  static update(User user) async {
    var u = await userDB.findOne({"_id": user.id});
    u["firstName"] = user.firstName;
    u["lastName"] = user.lastName;
    u["login"] = user.login;
    u["password"] = user.password;
    await userDB.save(u);
  } */

  /*DELETE user
  static delete(User user) async {
    await userDB.remove(where.id(user.id));
  } */
}
