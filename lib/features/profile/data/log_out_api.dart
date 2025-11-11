import 'dart:convert';

import 'package:blog_app/constants/app_constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class LogOutApi {
  final Store = GetStorage();
   logoutPost() async {
    String token = Store.read("token");
    final response = await post(
      Uri.parse("$baseUrl$logout"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print(data);
    return data;
  }
}
