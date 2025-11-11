// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/models/login_data_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class ApiLogin {
  final store = GetStorage();

  Future loginAcc({
    required String email,
    required String password,
  }) async {
    try {
      final response = await post(
        Uri.parse('$baseUrl$login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': "application/json"},
      );

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);

        print('POST successful: $decodedData');

        var data = LogindataModel.fromJson(decodedData);
        store.write("token", data.data.token);
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
