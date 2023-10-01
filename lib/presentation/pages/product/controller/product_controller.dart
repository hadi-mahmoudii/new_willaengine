import 'package:get/get.dart';
import 'package:willaengine/presentation/pages/Home/models/product_model.dart';
import 'package:willaengine/presentation/pages/Home/repo/home_repository.dart';
import 'package:willaengine/presentation/pages/product/repo/product_repo.dart';

class ProductController extends GetxController {
  RxBool loading = false.obs;
  StoreProduct? storeProduct;
  RxList<ProductParent> products = <ProductParent>[].obs;

  @override
  void onInit() {
    // getProducts();
    super.onInit();
  }

  getProducts() async {
    loading.value = true;
    storeProduct = await HomeRepository.getProducts();
    if (storeProduct != null) {
      products.value = storeProduct!.data!;
      print(storeProduct);
    }
    loading.value = false;
  }

  getCategoryProducts(int id) async {

    loading.value = true;
    storeProduct = await ProductRepo.getProductsCategory(id);
    if (storeProduct != null) {
      products.value = storeProduct!.data!;
      print(storeProduct);
    }
    loading.value = false;
  }
}
