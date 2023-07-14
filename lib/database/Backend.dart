import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConnectBackend  {
  // The prints in this file are for debugging, uncomment to see whats going on.

  static Future<String> authenticateUser(String login, String password) async {

    // Create a URL to the API you want to access.
    var url = Uri.https("oceanlogger-046c28329f84.herokuapp.com", "api/login");

    // print(url);

    // Header for the POST call.
    Map<String,String> headers = {'Content-Type': 'application/json'};

    // Body for the POST call.
    final jsonObject = jsonEncode(
      {
        "login":"testuser1",
        "password":"Orange123!"
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






}

