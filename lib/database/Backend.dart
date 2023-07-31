import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConnectBackend  {

  static Future<String> authenticateUser(String login, String password) async {
    //Takes login and password from user input, returns error if user is not valid.
    // The prints in this file are for debugging, uncomment to see whats going on.

    // Create a URL to the API you want to access.
    var url = Uri.https("oceanlogger-046c28329f84.herokuapp.com", "api/login");
    //print(url);
    // Header for the POST call.
    Map<String,String> headers = {'Content-Type': 'application/json'};

    // Body for the POST call.
    final jsonObject = jsonEncode(
        {
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

    //STORE access token, saved in shared_preferences to be accessed in other files
    String jwt = '';
    try {
      jwt = retJsonObject['accessToken'];
    }
    catch(e) {
      print("Access token could not be stored.");
    }

    saveJwtToSharedPreferences(jwt);


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

    //print(response.statusCode);
    //print(response.body);
    // Parse the returned body.
    final retJsonObject = jsonDecode(response.body);

    //print(retJsonObject);

    // Returns an empty string for no error, or an error message string.
    //If there is an error, the email is not in the database.
    String err = retJsonObject['error'];

    return err;
  }

  //addDiveLog
  static Future<String> addDiveLog(String title, String location, String date,
      String diveTime, String maxDepth, String temperature, String visibility,
      String startAirPressure, String endAirPressure, String diveComputer, String notes) async {

    // Create a URL to the API you want to access.
    var url = Uri.https(
        "oceanlogger-046c28329f84.herokuapp.com", "api/addlog");

    //print(url);
    // Header for the POST call.
    Map<String, String> headers = {'Content-Type': 'application/json'};

    //get saved accessToken for user.
    String? accessToken = await getJwtFromSharedPreferences();

    if (accessToken == null)
    {
      return "Invalid access token. Please sign in again.";
    }

    //decode jwt to get userid
    Map<String, dynamic> decodedPayload = decodeJwt(accessToken);
    String ud = decodedPayload['id'];

    // Body for the POST call.
    final jsonObject = jsonEncode(
        {
          "accessToken": accessToken,
          "userid": ud,
          "title": title,
          "location": location,
          "date": date,
          "diveTime": diveTime,
          "maxDepth": maxDepth,
          "temperature": temperature,
          "visibility": visibility,
          "startAirPressure": startAirPressure,
          "endAirPressure": endAirPressure,
          "diveComputer": diveComputer,
          "notes": notes,
        }
    );
    //print(jsonObject);
    // Make the API call.
    var response = await http.post(url, headers: headers, body: jsonObject);

    final retJsonObject = jsonDecode(response.body);

    String err = retJsonObject['error'];

    if(err == "") {
      //update access token, only if add returns no error.
      saveJwtToSharedPreferences(retJsonObject['accessToken']);
    }
    return err;
  }

  // searchDiveLog
  static Future<dynamic> searchDiveLog(String title, String location, String startDate,
      String endDate) async {

    // Create a URL to the API you want to access.
    var url = Uri.https(
        "oceanlogger-046c28329f84.herokuapp.com", "api/searchlog");

    // Header for the POST call.
    Map<String, String> headers = {'Content-Type': 'application/json'};

    //get saved accessToken for user.
    String? accessToken = await getJwtFromSharedPreferences();

    if (accessToken == null)
    {
      return "Invalid access token. Please sign in again.";
    }

    //decode jwt to get userid
    Map<String, dynamic> decodedPayload = decodeJwt(accessToken);
    String ud = decodedPayload['id'];

    // Body for the POST call.
    final jsonObject = jsonEncode(
        {
          "accessToken": accessToken,
          "userid": ud,
          "title": title,
          "location": location,
          "startDate":startDate,
          "endDate":endDate
        }
    );

    // Make the API call.
    var response = await http.post(url, headers: headers, body: jsonObject);

    final retJsonObject = jsonDecode(response.body);

    String err = retJsonObject['error'];

    if (err != "")
    {
      return err;
    }

    saveJwtToSharedPreferences(retJsonObject['accessToken']);

    var temp = retJsonObject['result'];

    return temp;
  }


  //SAVE jwt to storage
  static Future<void> saveJwtToSharedPreferences(String jwt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);
  }

  //GET jwt from storage
  static Future<String?> getJwtFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt');
  }

  //DECODE jwt
  static Map<String, dynamic> decodeJwt(String token) {
    List<String> parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid JWT format. It must consist of three parts separated by dots.');
    }

    String payloadBase64 = parts[1];
    String normalizedPayload = base64Url.normalize(payloadBase64);
    String payloadJson = utf8.decode(base64Url.decode(normalizedPayload));

    Map<String, dynamic> payloadMap = jsonDecode(payloadJson);
    return payloadMap;
  }

}
