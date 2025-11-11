import 'dart:convert';
import 'package:blog_app/constants/app_constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class EditProfileApi {
  final store = GetStorage();

  putProfile({
    required String name,
    required String phone,
  }) async {
    var data;
    String token = store.read("token");
    try {
      final respone = await put(
        Uri.parse("$baseUrl$profile"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"name": name, "phone": phone}),
      );
      if (respone.statusCode == 200) {
        data = jsonDecode(respone.body);
        return data;
      } else {
        data = "eror";
        return data;
      }
    } catch (e) {
      return data = "eror $e";
    }
  }
}
