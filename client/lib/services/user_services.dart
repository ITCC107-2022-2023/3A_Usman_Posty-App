import 'dart:convert';

import '../constants/constant.dart';
import '../hooks/response.dart';
import 'package:http/http.dart' as http;
import '../models/User.dart';

Future<Response> login(String email, String password, String userToken) async {
  Response apiResponse = Response();
  try {
    final response = await http.post(Uri.parse(loginURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    }, body: {
      'email': email,
      'password': password
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        Map<String, String> validationErrors = {};
        errors.forEach((key, value) {
          validationErrors[key] = value[0];
        });
        apiResponse.error = validationErrors as String?;
        break;
      default:
        apiResponse.error = sww;
        break;
    }
  } catch (error) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<Response> register(
    String name, String email, String password, String userToken) async {
  Response apiResponse = Response();
  try {
    final response = await http.post(Uri.parse(registerURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken'
        },
        body: jsonEncode({'name': name, 'email': email, 'password': password}));
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = sww;
        break;
    }
  } catch (error) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
