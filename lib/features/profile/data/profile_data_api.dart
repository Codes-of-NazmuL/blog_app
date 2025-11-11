// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/models/profile_data_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class ProfileDataApi {
  final store = GetStorage();
  profileGet() async {
    var data;
    String token = store.read("token");
    try {
      final response = await get(
        Uri.parse("$baseUrl$profile"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        return data;
      } else {
        data = "eror";
        return data;
      }
    } catch (e) {
      data = "Error $e";
      return data;
    }
  }

  Future<ProfileDataModel?>  fetchProfile()async {
    String eror;
    var data = await profileGet();
    if (data.runtimeType == String) {
      eror = data;
    } else {
      return ProfileDataModel.fromJson(data);
    }
  }
}
