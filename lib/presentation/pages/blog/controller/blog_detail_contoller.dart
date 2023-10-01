import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/blog/model/blog_model.dart';
import 'package:willaengine/presentation/pages/blog/repo/blog_repo.dart';

class BlogDetailController extends GetxController {
  var article = Rxn<Article>();
  RxBool detailLoading = false.obs;

  @override
  void onInit() {
    var argument = Get.arguments as Map;
    int id = argument!['id'];
    getBlogDetail(id);
    Logger().i(id);
    super.onInit();
  }

  getBlogDetail(int id) async {
    detailLoading.value = true;
    article.value = await BlogRepo.getBlogsDetail(id);
    Logger().w(article!.value?.title);
    detailLoading.value = false;
  }
}
