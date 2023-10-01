import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/login_page.dart';
import 'package:willaengine/presentation/pages/Home/home_main_page.dart';
import 'package:willaengine/presentation/pages/blog/blog_main_page.dart';
import 'package:willaengine/presentation/pages/product/product_main_page.dart';
import 'package:willaengine/presentation/pages/profile/profile_main_page.dart';
import 'package:willaengine/presentation/pages/search/search_main_page.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/configs/app_session.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/controller/global_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalController globalController = GlobalController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    Logger().w(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    Logger().d(AppSession.token == "Bearer ");
    super.initState();
  }

  static final List<Widget> _pages = <Widget>[
    HomeMainPage(),
    const ProductMainPage(),
    const BlogMainPage(),
    const SearchMainPage(),
    (AppSession.token != '' && AppSession.token.toString() != 'Bearer ')
        ? const ProfileMainPage()
        : const LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: InkWell(
        onTap: () => Get.toNamed(Routes.shopList),
        child: Container(
          height: 7.h,
          width: 7.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, //New
                  blurRadius: 25.0,
                  offset: Offset(0, 5))
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.bag,
                color: AppColors.black,
              ),
              Positioned.directional(
                  start: 10,
                  top: 12,
                  textDirection:
                      globalController.direction.value == TextDirection.rtl
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                  child: CircleAvatar(
                    backgroundColor: AppColors.greenTitle,
                    radius: 8,
                    child: Center(
                      child: Obx(
                        () => Text(
                          GlobalController.shoppingCardItem.value.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: _selectedIndex == 4
          ? (AppSession.token != '' && AppSession.token.toString() != 'Bearer ')
              ? const ProfileMainPage()
              : const LoginPage()
          : _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
          notchMargin: 5,
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.home,
                  color: _selectedIndex == 0
                      ? Colors.black
                      : AppColors.navigatorIcon,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.menu,
                  color: _selectedIndex == 1
                      ? Colors.black
                      : AppColors.navigatorIcon,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.connection,
                  color: _selectedIndex == 2
                      ? Colors.black
                      : AppColors.navigatorIcon,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.search,
                  color: _selectedIndex == 3
                      ? Colors.black
                      : AppColors.navigatorIcon,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.profile,
                  color: _selectedIndex == 4
                      ? Colors.black
                      : AppColors.navigatorIcon,
                ),
                label: '',
              ),
            ],
            // type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            unselectedItemColor: AppColors.navigatorIcon,
            selectedItemColor: Colors.black,
            iconSize: 40,
            onTap: _onItemTapped,
          )),
    );
  }
}
