import 'dart:convert';
import 'package:bionixapp/verifyCode.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'SignUpPage.dart';
import 'forgetPassword.dart';
import 'model/user.dart';

String serverADDR = "54.160.108.47";
int port = 80;

String sessionToken = "";

Future<Map<String, dynamic>> login(String username, String password) async {
  final url = Uri.parse('http://$serverADDR:$port/login.php');
  final response = await http.post(
    url,
    body: {'user': username, 'password': password},
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else {
    print(response.statusCode);
    throw Exception('Failed to login');
  }
}

Future<bool> checkToken(String? token) async {
  if (token!.isEmpty) {
    throw Exception('Please Provide Token !');
  }
  final url = Uri.parse(
      'http://$serverADDR:$port/checkToken.php'); // Replace with your server address
  final response = await http.post(
    url,
    body: {'token': token},
  );

  if (response.statusCode == 200) {
    if (json.decode(response.body)['message'] == 'Valid') {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to check token');
  }
}

Future<void> logout() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final url = Uri.parse(
      'http://$serverADDR:$port/logout.php'); // Replace with your server address
  try {
    final response = await http.post(
      url,
      body: {'token': sessionToken},
    );

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      final data = json.decode(response.body);
      print(data['message']);
      if (data['message'] == "Token has been deleted successfully.") {
        prefs.remove('token');
      }
    } else {
      throw Exception('Failed to log out');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<String> fetchAverage(String token, String parameter) async {
  final response = await http.post(
    Uri.parse(
        'http://$serverADDR:$port/getData.php'), // Replace with your PHP script URL
    body: {
      'token': token,
      'parameter': parameter,
    },
  );

  if (response.statusCode == 200) {
    String averageValue = response.body;
    return (averageValue);
  } else {
    return ('NaN   ');
  }
}

validateUserEmail() async {
  var url = Uri.parse('http://$serverADDR:$port/validate_email.php');
  var emailController = email.text.trim();
  try {
    var res = await http.post(
      url,
      body: {'email': emailController},
    );
    if (res.statusCode ==
        200) //from  flutter app the connexion with api to server  = success
    {
      var resBodyOfValidatedEmail = jsonDecode(res.body);
      if (resBodyOfValidatedEmail['emailFound']) {
        Fluttertoast.showToast(msg: "email is already in someone use");
      } else {
        registerAndSaveUserRecord();
      }
    }
  } catch (e) {
    print(e.toString());
    Fluttertoast.showToast(msg: e.toString());
  }
}

registerAndSaveUserRecord() async {
  var url = Uri.parse('http://$serverADDR:$port/signup.php');
  User userModel = User(
    user.text.trim(),
    pass.text.trim(),
    email.text.trim(),
  );
  try {
    var response = await http.post(
      url,
      body: userModel.toJson(),
    );

    if (response.statusCode == 200) {
      var resBodyOfSignUp = jsonDecode(response.body);
      if (resBodyOfSignUp['success']) {
        Fluttertoast.showToast(msg: "Congras, You are sign up succesfully");
      } else {
        Fluttertoast.showToast(msg: "Error Occured, Try again.");
      }
    }
  } catch (e) {
    print(e.toString());
    Fluttertoast.showToast(msg: e.toString());
  }
}

forgetUserPassword() async {
  var url = Uri.parse('http://$serverADDR:$port/verifycode.php');
  var emailController = email2.text.trim();
  try {
    var res = await http.post(
      url,
      body: {'email': emailController},
    );
    if (res.statusCode ==
        200) //from  flutter app the connexion with api to server  = success
    {
      var resBodyOfValidatedEmail = jsonDecode(res.body);
      print("Decoded JSON: $resBodyOfValidatedEmail"); // Debugging line
      if (resBodyOfValidatedEmail['success']) {
        sendCodeValidation();
      } else {
        Fluttertoast.showToast(msg: "Error Occured, Try again.");
      }
    }
  } catch (e) {
    print(e.toString());
    Fluttertoast.showToast(msg: e.toString());
  }
}

sendCodeValidation() async {
  var url = Uri.parse('http://$serverADDR:$port/send_code.php');
  var emailController = email2.text.trim();

  try {
    var response = await http.post(
      url,
      body: {'email': emailController},
    );

    if (response.statusCode == 200) {
      var resBodyOfSignUp = jsonDecode(response.body);
      print(resBodyOfSignUp);
      if (resBodyOfSignUp['success']) {
        print('email sent succesfully');
      } else {
        Fluttertoast.showToast(msg: "Error Occured, Try again.");
      }
    }
  } catch (e) {
    print(e.toString());
    Fluttertoast.showToast(msg: e.toString()); // here we display error
  }
}
