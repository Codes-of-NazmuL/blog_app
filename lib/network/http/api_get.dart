import 'dart:convert';

import 'package:http/http.dart';

class ApiClass {
  Future<List<Map<String, dynamic>>> getData({required String url}) async {
    final response = await get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);

      if (data is List) {
        return data.cast<Map<String, dynamic>>();
      } else
      // ignore: dead_code
      {
        throw Exception("api response not a list");
      }
    } else {
      throw Exception("data get faild");
    }
  }
}
