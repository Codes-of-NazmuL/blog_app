import 'dart:convert';
import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/models/search_data_model.dart';
import 'package:http/http.dart';

class SearchApi {
  Future<SearchDataModel?> searchData({required String searchtext}) async {
    try {
      final response = await get(Uri.parse("$baseUrl$search$searchtext"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final searchModel = SearchDataModel.fromJson(data);
        print(data);
        return searchModel;
      } else {
        print("API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception/Network Error: $e");
      return null;
    }
  }
}
