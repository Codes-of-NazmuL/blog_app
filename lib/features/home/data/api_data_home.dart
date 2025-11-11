import 'dart:convert';

import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/models/posts_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class ApiDataHome extends ChangeNotifier {
  PostsDataModel? stored;
  getPosts() async {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    try {
      final response = await get(Uri.parse("$baseUrl$posts"));
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

  Future<PostsDataModel?> dataFetcher() async {
    // ignore: unused_local_variable
    String? e;
    var data = await getPosts();
    if (data.runtimeType == String) {
      e = data;
    } else {
      stored = PostsDataModel.fromJson(data);
      return stored;
    }
  }
}
