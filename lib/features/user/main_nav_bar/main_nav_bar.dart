import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/di/injection.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/controller/main_nav_controller.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';

import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class MainNavBar extends StatelessWidget {
  final Widget child;

  MainNavBar({super.key, required this.child});

  final NavController navController = Get.find<NavController>();

  final List<String> routes = [
    RoutePath.homeScreen.addBasePath,
    RoutePath.cartScreen.addBasePath,
    RoutePath.productScreen.addBasePath,
    RoutePath.chatScreen.addBasePath,
    RoutePath.orderScreen.addBasePath,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.backgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: navController.currentIndex.value,

          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.navUnselectedColor,

          selectedLabelStyle: context.bodySmall.copyWith(
            color: AppColors.white,
          ),

          unselectedLabelStyle: context.bodySmall.copyWith(
            color: AppColors.navUnselectedColor,
          ),

          onTap: (index) {
            navController.changeIndex(index);
            context.go(routes[index]);
          },
          items: [
            BottomNavigationBarItem(
              icon: CustomImage(
                imageSrc: AppAssets.homeNav,
                height: ResponsiveHelper.iconSize(24),
                width: ResponsiveHelper.iconSize(24),
                imageColor: navController.currentIndex.value == 0
                    ? AppColors.white
                    : AppColors.navUnselectedColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomImage(
                imageSrc: AppAssets.cartNav,
                height: ResponsiveHelper.iconSize(24),
                width: ResponsiveHelper.iconSize(24),
                imageColor: navController.currentIndex.value == 1
                    ? AppColors.white
                    : AppColors.navUnselectedColor,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: CustomImage(
                imageSrc: AppAssets.productNav,
                height: ResponsiveHelper.iconSize(24),
                width: ResponsiveHelper.iconSize(24),
                imageColor: navController.currentIndex.value == 2
                    ? AppColors.white
                    : AppColors.navUnselectedColor,
              ),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: CustomImage(
                imageSrc: AppAssets.chatNav,
                height: ResponsiveHelper.iconSize(24),
                width: ResponsiveHelper.iconSize(24),
                imageColor: navController.currentIndex.value == 3
                    ? AppColors.white
                    : AppColors.navUnselectedColor,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: CustomImage(
                imageSrc: AppAssets.orderNav,
                height: ResponsiveHelper.iconSize(24),
                width: ResponsiveHelper.iconSize(24),
                imageColor: navController.currentIndex.value == 4
                    ? AppColors.white
                    : AppColors.navUnselectedColor,
              ),
              label: 'Order',
            ),
          ],
        ),
      ),
    );
  }
}
