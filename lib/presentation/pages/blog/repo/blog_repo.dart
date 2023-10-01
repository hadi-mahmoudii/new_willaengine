import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/blog/model/blog_model.dart';
import 'package:willaengine/utils/configs/urls.dart';
import 'package:http/http.dart' as http;

class BlogRepo {
  static Future getBlogs() async {
    BlogModel? blog;
    try {
      var response = await http.get(Uri.parse(Urls.getBlogs), headers: {});

      final responseData = json.decode(response.body);
      print(responseData);
      if (response.statusCode == 200) {
        blog = BlogModel.fromJson(responseData);
        return blog;
      } else {}
    } catch (e) {
      Logger().e(e);
    }
  }

  static Future getBlogsDetail(int id) async {
    Article? article;
    try {
      var response = await http.get(
        Uri.parse("${Urls.getBlogs}/$id"),
        headers: {},
      );
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        article = Article.fromJson(responseData['data']);

        return article;
      } else {}
    } catch (e) {
      Logger().e(e);
    }
  }
}
