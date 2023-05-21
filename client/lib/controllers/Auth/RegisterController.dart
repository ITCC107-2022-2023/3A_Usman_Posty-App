import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:client/constants/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:client/home.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  Future register({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    try {
      isLoading(true);
      isLoading.value = true;
      var data = {
        'name': name,
        'email': email,
        'password': password,
      };
      var response = await http.post(
        Uri.parse(baseURL + '/register'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 201) {
        isLoading.value = false;
        token.value = json.decode(response.body)['data']['userToken'];
        box.write('userToken', token.value);
        Get.offAll(() => const MyHomePage());
        Get.snackbar(
          'Success!',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'].toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
      }
    } catch (err) {
      isLoading.value = false;
      print(err.toString());
    }
  }
}
