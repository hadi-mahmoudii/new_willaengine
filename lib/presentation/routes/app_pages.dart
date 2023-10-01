import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:willaengine/presentation/pages/Auth/Verification_page.dart';
import 'package:willaengine/presentation/pages/Auth/forgot_pass_page.dart';
import 'package:willaengine/presentation/pages/Auth/login_page.dart';
import 'package:willaengine/presentation/pages/Auth/new_password_page.dart';
import 'package:willaengine/presentation/pages/Auth/registration_page.dart';
import 'package:willaengine/presentation/pages/Home/controller/home_controller.dart';
import 'package:willaengine/presentation/pages/Home/home_page.dart';
import 'package:willaengine/presentation/pages/blog/blog_detail_page.dart';
import 'package:willaengine/presentation/pages/blog/blog_main_page.dart';
import 'package:willaengine/presentation/pages/blog/controller/blog_controller.dart';
import 'package:willaengine/presentation/pages/blog/controller/blog_detail_contoller.dart';
import 'package:willaengine/presentation/pages/comments/comments_list_page.dart';
import 'package:willaengine/presentation/pages/product/controller/product_controller.dart';
import 'package:willaengine/presentation/pages/product/controller/product_detail_controller.dart';
import 'package:willaengine/presentation/pages/product/product_detail_page.dart';
import 'package:willaengine/presentation/pages/product/product_list_page.dart';
import 'package:willaengine/presentation/pages/product/product_technical_page.dart';
import 'package:willaengine/presentation/pages/profile/change_password_page.dart';
import 'package:willaengine/presentation/pages/profile/personal_info_page.dart';
import 'package:willaengine/presentation/pages/shop/shop_main_page.dart';
import 'package:willaengine/presentation/pages/splash/splash_page.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/controller/global_controller.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      binding: BindingsBuilder(() {
        Get.lazyPut<GlobalController>(() => GlobalController());
      }),
      page: () => const SplashPage(),
    ),
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(name: Routes.forgotPass, page: () => const ForgotPassPage()),
    GetPage(name: Routes.verification, page: () => const VerificationPage()),
    GetPage(name: Routes.newPassword, page: () => NewPasswordPage()),
    GetPage(name: Routes.registration, page: () => const RegistrationPage()),
    GetPage(
        name: Routes.homePage,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.put(HomeController());
        })),
    GetPage(name: Routes.comments, page: () => const CommentListPage()),
    GetPage(name: Routes.technicalDetail, page: () => const ProductTechnicalPage()),
    GetPage(name: Routes.shopList, page: () => const ShopMainPage()),
    GetPage(
        name: Routes.blogPage,
        page: () => BlogMainPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<BlogController>(
            () => BlogController(),
          );
        })),
    GetPage(
        name: Routes.blogDetail,
        page: () => BlogDetailPage(),
        middlewares: [AuthMiddleware()],
        binding: BindingsBuilder(() {
          Get.lazyPut<BlogDetailController>(
            () => BlogDetailController(),
          );
        })),
    GetPage(
        name: Routes.productDetail,
        page: () => const ProductDetailPage(),
        middlewares: [AuthMiddleware()],
        binding: BindingsBuilder(() {
          Get.lazyPut<ProductDetailController>(
            () => ProductDetailController(),
          );
        })),
    GetPage(
      name: Routes.personalInfoPage,
      page: () => const PersonalInfoPage(),
    ),
    GetPage(
      name: Routes.changePasswordPage,
      page: () => const ChangePasswordPage(),
    ),
    GetPage(
        name: Routes.productList,
        page: () => ProductListPage(),
        middlewares: [AuthMiddleware()],
        binding: BindingsBuilder(() {
          Get.lazyPut<ProductController>(
            () => ProductController(),
          );
        })),
  ];
}

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  bool isAuthenticated = false;

  @override
  RouteSettings? redirect(String? route) {
    isAuthenticated = true;
    if (isAuthenticated == false) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
