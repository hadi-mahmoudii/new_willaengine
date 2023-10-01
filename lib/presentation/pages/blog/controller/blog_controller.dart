import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/blog/model/blog_model.dart';
import 'package:willaengine/presentation/pages/blog/repo/blog_repo.dart';

class BlogController extends GetxController {
  //*******var*********
  RxBool loading = false.obs;
  BlogModel? blogModel;
  var articles = <Article>[].obs;

  @override
  void onInit() {
    getBlogs();
    super.onInit();
  }

  //******Methods******

  getBlogs() async {
    loading.value = true;
    blogModel = await BlogRepo.getBlogs();
    if (blogModel != null) {
      articles.value = blogModel!.articles!;
    }
    loading.value = false;
  }
}
