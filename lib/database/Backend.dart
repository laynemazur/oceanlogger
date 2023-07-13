import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConnectBackend  {
  //static var response;

  static Future<String> authenticateUser(String login, String password) async {
    String ret = '';

    var url = Uri.https('oceanlogger-046c28329f84.herokuapp.com', 'api/login');
    //String response = await http.get(url,  headers: {'login': 'laymazur', 'password': 'Laynie@2020'});

    http.Response result = await http.post(url, body: utf8.encode('login: laymazur, password: Laynie@2020'),
      headers: { "Accept": "application/json", "Content-Type": "application/json",}, encoding: Encoding.getByName("utf-8"));

    ret = result.body;

    return ret;
  }






}

