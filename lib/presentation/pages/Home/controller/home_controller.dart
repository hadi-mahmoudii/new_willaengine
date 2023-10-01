import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/Home/models/product_model.dart';

import 'package:willaengine/presentation/pages/Home/models/slider_model.dart';
import 'package:willaengine/presentation/pages/Home/repo/home_repository.dart';
import 'package:willaengine/presentation/pages/blog/model/blog_model.dart';
import 'package:willaengine/presentation/pages/product/models/category_model.dart';

class HomeController extends GetxController{
  //******var*******
  var loading = false.obs;
  var articleLoading = false.obs;
  var specialProLoading = false.obs;
  var categoryLoading = false.obs;

  StoreProduct? storeProduct;
  RxList<ProductParent> products = <ProductParent>[].obs;
  RxList<SliderModel> sliders = <SliderModel>[].obs;
  RxList<ProductParent> specialsProduct = <ProductParent>[].obs;
  RxList<Article> specialsArticle = <Article>[].obs;
  RxList<CategoryModel> mainCategories = <CategoryModel>[].obs;


  @override
  void onInit() {
  getMainModels();
  getSpecialArticles();
  getSpecialProducts();
  getMainCategories();
    super.onInit();
  }



//****Methods*****


  getMainModels()async{
    loading.value = true;
    sliders.value = await HomeRepository.getSliders();
    loading.value = false;
  }

  getSpecialProducts()async{
    specialProLoading.value = true;
    specialsProduct.value =await HomeRepository.getSpecialsProduct();
    Logger().i(specialsProduct);
    specialProLoading.value = false;
  }

  getSpecialArticles()async{
    articleLoading.value = true;
    specialsArticle.value = await HomeRepository.getSpecialArticles();
    articleLoading.value =false;
  }

  getMainCategories()async{
    categoryLoading.value = true;
    mainCategories.value = await HomeRepository.getMainCategories();
    categoryLoading.value =false;
  }
}