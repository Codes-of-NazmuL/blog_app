// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/models/register_data_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class ApiRegister {
  final store = GetStorage();
  RegisterDataModel? data;
  Future registerAcc({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await post(
        Uri.parse('$baseUrl$register'),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        }),
        headers: {'Content-Type': "application/json"},
      );

      if (response.statusCode == 201) {
        final decodedData = json.decode(response.body);

        print('POST successful: $decodedData');

        data = RegisterDataModel.fromJson(decodedData);
        store.write("token", data!.data.token);
        return data;
      } else {
        print('POST failed: ${response.statusCode}');
        throw Exception('POST request failed.');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
