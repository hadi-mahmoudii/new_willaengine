import 'package:get/get.dart';
import 'package:willaengine/presentation/pages/Home/models/categories_model.dart';
import 'package:willaengine/presentation/pages/product/models/category_model.dart';
import 'package:willaengine/presentation/pages/product/repo/product_repo.dart';

class CategoryController extends GetxController{
  var loading = false.obs;
  List<CategoryModel> categories = [];

  @override
  void onInit() {
   getCategories();
    super.onInit();
  }

  getCategories()async{
    loading.value = true;
   categories = await ProductRepo.getCategories();
   loading.value = false;
  }

}