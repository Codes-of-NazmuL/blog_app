import 'dart:convert';

import 'package:blog_app/constants/app_constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class ChangePassword {
  var data;
  final store = GetStorage();
  chagepass({required String oldpass, required String newPass}) async {
    var token = store.read("token");
    try {
      final response = await post(
        Uri.parse("$baseUrl$password"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "current_password": oldpass,
          "new_password": newPass,
        }),
      );
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        print(data);
        return data;
      } else {
        print("Eror on change password");
        return data = "eror";
      }
    } catch (e) {
      print("eror $e");
      data = "eror $e";
    }
  }
}
