import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConnectBackend  {

  static Future<String> authenticateUser(String login, String password) async {
    //Takes login and password from user input, returns error if user is not valid.
    // The prints in this file are for debugging, uncomment to see whats going on.

    // Create a URL to the API you want to access.
    var url = Uri.https("oceanlogger-046c28329f84.herokuapp.com", "api/login");
    // print(url);
    // Header for the POST call.
    Map<String,String> headers = {'Content-Type': 'application/json'};

    // Body for the POST call.
    final jsonObject = jsonEncode(
        {
          "login":login,
          "password":password
        }
    );
    // print(jsonObject);
    // Make the API call.
    var response = await http.post(url, headers:headers,body:jsonObject);

    // print(response.statusCode);
    // print(response.body);
    // Parse the returned body.
    final retJsonObject = jsonDecode(response.body);

    // print(retJsonObject);

    // Returns an empty string for no error, or an error message string.
    String err = retJsonObject['error'];

    return err;
  }

  static Future<String> registerUser(String email, String login, String password) async{
    //Takes email, username, password for user to add to database, MUST ADD REGEX REQS!!
    // Create a URL to the API you want to access.
    var url = Uri.https("oceanlogger-046c28329f84.herokuapp.com", "api/register");

    //print(url);
    // Header for the POST call.
    Map<String,String> headers = {'Content-Type': 'application/json'};

    // Body for the POST call.
    final jsonObject = jsonEncode(
        {
          "email":email,
          "login":login,
          "password":password
        }
    );
    //print(jsonObject);
    // Make the API call.
    var response = await http.post(url, headers:headers,body:jsonObject);

    //print(response.statusCode);
    //print(response.body);
    // Parse the returned body.
    final retJsonObject = jsonDecode(response.body);

    //print(retJsonObject);

    // Returns an empty string for no error, or an error message string.
    String err = retJsonObject['error'];

    return err;
  }


  static Future<String> forgotUser(String email) async {
    //Takes email and sends verification to your email
    // Create a URL to the API you want to access.
    var url = Uri.https(
        "oceanlogger-046c28329f84.herokuapp.com", "api/sendreset");

    //print(url);
    // Header for the POST call.
    Map<String, String> headers = {'Content-Type': 'application/json'};

    // Body for the POST call.
    final jsonObject = jsonEncode(
        {
          "email": email,
        }
    );
    //print(jsonObject);
    // Make the API call.
    var response = await http.post(url, headers: headers, body: jsonObject);

    print(response.statusCode);
    print(response.body);
    // Parse the returned body.
    final retJsonObject = jsonDecode(response.body);

    print(retJsonObject);

    // Returns an empty string for no error, or an error message string.
    //If there is an error, the email is not in the database.
    String err = retJsonObject['error'];

    return err;
  }

}
