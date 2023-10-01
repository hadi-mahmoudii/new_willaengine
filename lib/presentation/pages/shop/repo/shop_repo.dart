import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/profile/repo/profile_repo.dart';
import 'package:willaengine/presentation/pages/shop/model/shop_card_model.dart';
import 'package:willaengine/utils/configs/app_session.dart';
import 'package:willaengine/utils/configs/urls.dart';
import 'package:willaengine/utils/controller/global_controller.dart';

class ShopRepo {
  //
  // GET CARDS
  //
  static getTempShopCards() async {
    Dio dio = Dio();
    Logger().w(GlobalController.tempToken);
    try {
      final response = await dio.get(
          "${Urls.myTempShoppingCard}/${GlobalController.tempToken}",
          options: Options(
            headers: {"Module": "store"},
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final shopCardModel = ShopCardModel.fromJson(response.data);
        return shopCardModel;
      }
    } catch (exeption) {
      Logger().e(exeption);
    }
  }

  static getShopCards() async {
    Dio dio = Dio();
    try {
      final response = await dio.get("${Urls.myShoppingCart}",
          options: Options(
            headers: {
              "Module": "store",
              "Authorization": AppSession.token,
            },
          ));
      Logger().w(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final shopCardModel = ShopCardModel.fromJson(response.data);
        return shopCardModel;
      }
    } catch (exeption) {
      Logger().e(exeption);
    }
  }

  //
  // ADD
  //
  static Future<bool> add(int id, int quantity, BuildContext context) async {
    final url = AppSession.isLoggedIn
        ? Urls.addMyShoppingCart
        : "${Urls.myTempShoppingCard}/${GlobalController.tempToken}";
    Dio dio = Dio();
    final body = {
      "store_product_variation_id": id.toString(),
      "quantity": quantity.toString(),
    };
    try {
      final response = await dio.post(url,
          data: json.encode(body),
          options: Options(headers: {
            "Module": "store",
            "Authorization": AppSession.token,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        false;
      }
      return true;
    } on DioException catch (e) {
      errorHandler(e.response?.data['errors']['error'], context);
      return false;
    }
  }

  //
  // MERGE
  //
  static Future mergeShoppingCard() async {
    Dio dio = Dio();
    try {
      final response = dio.post(
          "${Urls.myShoppingCart}/${GlobalController.tempToken}/merge-temporary-items",
          options: Options(
            headers: {"Authorization": AppSession.token},
          ));
    } catch (e) {
      Logger().i(e);
    }
  }

  //
  // GET ITEMS COUNT
  //
  static Future getShopCardItems() async {
    Dio dio = Dio();
    final url = AppSession.isLoggedIn
        ? Urls.shoppingCardItem
        : "${Urls.myTempShoppingCard}/${GlobalController.tempToken}/items-count";
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {"Authorization": AppSession.token},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return int.parse(response.data['data']["shopping_cart_items_count"]);
      } else {
        return 0;
      }
    } catch (e) {
      Logger().e(e);
      return 0;
    }
  }

  //
  // QUANTITY
  //
  static Future changeQuantity(int shoppingCardId, int quantity) async {
    Dio dio = Dio();
    final url = AppSession.isLoggedIn
        ? '${Urls.myShoppingCart}/shopping-cart-item/$shoppingCardId/quantity/$quantity'
        : '${Urls.myTempShoppingCard}/${GlobalController.tempToken}/shopping-cart-item/$shoppingCardId/quantity/$quantity';
    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {"Authorization": AppSession.token},
        ),
      );
    } catch (e) {
      Logger().e(e);
    }
  }

  static Future delete(int shoppingCardId) async {
    Dio dio = Dio();
    final url = AppSession.isLoggedIn
        ? '${Urls.myShoppingCart}/items/$shoppingCardId'
        : '${Urls.myTempShoppingCard}/${GlobalController.tempToken}/items/$shoppingCardId';
    try {
      final response = await dio.delete(
        url,
        options: Options(
          headers: {"Authorization": AppSession.token},
        ),
      );
    } catch (e) {
      Logger().e(e);
    }
  }
}
