import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/shop/model/shop_card_model.dart';
import 'package:willaengine/presentation/pages/shop/repo/shop_repo.dart';
import 'package:willaengine/utils/configs/app_session.dart';
import 'package:willaengine/utils/controller/global_controller.dart';

class ShopController extends GetxController {
  GlobalController globalController = GlobalController();
  var loading = false.obs;
  var addLoading = false.obs;
  var shopCardModel = Rxn<ShopCardModel?>();

  final shopRepo = ShopRepo();

  getShopCards() async {
    loading.value = true;
    if (AppSession.isLoggedIn) {
      shopCardModel.value = await ShopRepo.getShopCards();
    } else {
      shopCardModel.value = await ShopRepo.getTempShopCards();
    }
    shoppingCardItems();
    loading.value = false;
  }

  addShoppingCard(int id, BuildContext context) async {
    addLoading.value = true;
    final bool response = await ShopRepo.add(id, 1, context);
    await shoppingCardItems();
    addLoading.value = false;
    return response;
  }

  static mergeShoppingCard() async {
    await ShopRepo.mergeShoppingCard();
    await shoppingCardItems();
  }

  void changeQuantity(int shoppingCardId, int quantity) async {
    loading.value = true;
    await ShopRepo.changeQuantity(shoppingCardId, quantity);
    await getShopCards();
    loading.value = false;
  }

  void deleteCard(int shoppingCardId) async {
    loading.value = true;
    await ShopRepo.delete(shoppingCardId);
    await getShopCards();
    loading.value = false;
  }

  static shoppingCardItems() async {
    final int response = await ShopRepo.getShopCardItems();
    Logger().i(response);
    GlobalController.shoppingCardItem.value = response;
  }
}
