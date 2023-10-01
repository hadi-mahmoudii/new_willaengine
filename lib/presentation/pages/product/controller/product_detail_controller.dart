import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/product/models/product_detail_model.dart';
import 'package:willaengine/presentation/pages/product/repo/product_repo.dart';

class ProductDetailController extends GetxController {
  RxBool loading = false.obs;
  RxBool similarLoading = false.obs;
  RxBool commentsLoading = false.obs;
  int? id;

  ProductDetailModel? product;
  List<ProductDetailModel> similarProduct = [];
  var currentVariant = Rxn<StoreProductVariations>();

  @override
  void onInit() {
    var argument = Get.arguments as Map;
    id = argument!['id'];
    getProductDetail(id!);
    getSimilarProduct(id!);
    super.onInit();
  }

  getProductDetail(int id) async {
    loading.value = true;
    product = await ProductRepo.getProductDetail(id);
    Logger().v(product!.storeProductVariations?.isNotEmpty);
    currentVariant.value = product!.storeProductVariations!.isNotEmpty ? product!.storeProductVariations![0] : null;
    loading.value = false;
  }

  getSimilarProduct(int id) async {
    similarLoading.value = true;
    similarProduct = await ProductRepo.getSimilarProducts(id);
    similarLoading.value = false;
  }

  void getProductsComments(int id) async {
    commentsLoading.value = true;
    await ProductRepo.getProductsComments('store_product', id);
    commentsLoading.value = false;
  }
}
