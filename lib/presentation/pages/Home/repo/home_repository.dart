import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/Home/models/product_model.dart';
import 'package:willaengine/presentation/pages/Home/models/slider_model.dart';
import 'package:willaengine/presentation/pages/blog/model/blog_model.dart';
import 'package:willaengine/presentation/pages/product/models/category_model.dart';
import 'package:willaengine/utils/configs/urls.dart';

class HomeRepository {
  static Future getProducts() async {
    StoreProduct? storeProduct;
    try {
      var response = await http.get(Uri.parse(Urls.getProducts), headers: {});
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        storeProduct = StoreProduct.fromJson(responseData);
        return storeProduct;
      } else {}
    } catch (e) {
      Logger().e(e);
    }
  }

  static Future getSliders() async {
    List<SliderModel> sliders = [];

    var response = await http.get(Uri.parse(Urls.getSliders), headers: {});
    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      SliderParent parent = SliderParent.fromJson(responseData);
      sliders = parent.data!;
      return sliders;
    } else {}
  }

  //**********special Products*********

  static Future getSpecialsProduct() async {
    Dio dio = Dio();

    List<ProductParent> specialProducts = [];
    try {
      var response = await dio.get(
        Urls.getSpecialProducts,
      );

      if (response.statusCode == 200) {
        response.data['data'].forEach((product) {
          specialProducts.add(ProductParent.fromJson(product));
        });

        return specialProducts;
      } else {}
    } catch (e) {
      Logger().e(e);
    }
  }

//********** special article***********

  static Future getSpecialArticles() async {
    Dio dio = Dio();
    List<Article> specialArticles = [];
    var response = await dio.get(
      Urls.getSpecialArticles,
    );
    if (response.statusCode == 200) {
      response.data['data'].forEach((article) {
        specialArticles.add(Article.fromJson(article));
      });
      return specialArticles;
    } else {}
  }

  //********** Main Categories ***********

  static Future getMainCategories() async {
    Dio dio = Dio();
    List<CategoryModel> categories = [];

    var response = await dio.get(
      Urls.getMainCategories,
    );
    if (response.statusCode == 200) {
      response.data['data'].forEach((category) {
        categories.add(CategoryModel.fromJson(category));
      });
      return categories;
    } else {}
  }
}
