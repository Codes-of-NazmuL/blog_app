import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/models/posts_data_model.dart';
import 'package:blog_app/network/http/api_get.dart';

class ApiDataHome {
  ApiClass apiClass = ApiClass();
  Future<List<PostsDataModel>> apidata() async {
    try {
      List<dynamic> data = await apiClass.getData(url: posts);
      return data.map((e) => PostsDataModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
