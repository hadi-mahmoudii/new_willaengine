import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/Home/models/categories_model.dart';
import 'package:willaengine/presentation/pages/Home/models/product_model.dart';
import 'package:willaengine/presentation/pages/product/models/category_model.dart';
import 'package:willaengine/presentation/pages/product/models/product_detail_model.dart';
import 'package:willaengine/utils/configs/urls.dart';

class ProductRepo {
  static Future getProductDetail(int id) async {
    Dio dio = Dio();
    ProductDetailModel? product;
    var response = await dio.get("${Urls.getProducts}/$id");
    final responseData = response.data['data'];
    if (response.statusCode == 200) {
      product = ProductDetailModel.fromJson(responseData);
      return product;
    } else {}
  }

  static Future getSimilarProducts(int id) async {
    Dio dio = Dio();
    List<ProductDetailModel>? similarProduct = [];
    var response = await dio.get("${Urls.getSimilarProducts}/$id");
    final responseData = response.data['data'];
    if (response.statusCode == 200) {
      responseData.forEach((response) {
        ProductDetailModel product = ProductDetailModel.fromJson(response);
        similarProduct.add(product);
      });

      return similarProduct;
    } else {}
  }

  static Future getCategories() async {
    Dio dio = Dio();
    List<CategoryModel>? categories = [];
    var response = await dio.get(Urls.getCategories);
    final responseData = response.data['data'];
    if (response.statusCode == 200) {
      responseData.forEach((response) {
        CategoryModel category = CategoryModel.fromJson(response);
        categories.add(category);
      });

      return categories;
    } else {}
  }

  static Future getProductsCategory(int id) async {
    Dio dio = Dio();
    StoreProduct? storeProduct;
    try {
      var response = await dio.get("${Urls.getProductsCategory}$id");
      if (response.statusCode == 200) {
        storeProduct = StoreProduct.fromJson(response.data);
        return storeProduct;
      } else {}
    } catch (e) {
      Logger().e(e);
    }
  }

  static getProductsComments(String relType, int id) async {
    Dio dio = Dio();
    try {
      var response = await dio.get("${Urls.getProductsComments}?rel_id=$id&rel_type=$relType");
      if (response.statusCode == 200) {
        Logger().w(response);
      }
    } catch (e) {}
  }
}
