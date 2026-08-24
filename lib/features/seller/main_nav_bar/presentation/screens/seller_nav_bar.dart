import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/di/injection.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/controller/main_nav_controller.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class SellerNavBar extends StatelessWidget {
  final Widget child;
  SellerNavBar({super.key, required this.child});


  final NavController navController = Get.find<NavController>();

  final List<String> routes = [
    RoutePath.orderSellerScreen.addBasePath,
    RoutePath.chatSellerScreen.addBasePath,
    RoutePath.productSellerScreen.addBasePath,
    RoutePath.addProductScreen.addBasePath,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.backgroundColor,
          type: BottomNavigationBarType.fixed,

          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.navUnselectedColor,

          selectedLabelStyle: context.bodySmall.copyWith(
            color: AppColors.white,
          ),

          unselectedLabelStyle: context.bodySmall.copyWith(
            color: AppColors.navUnselectedColor,
          ),

          currentIndex: navController.currentIndexSeller.value,

          onTap: (index) {
            navController.changeIndexSeller(index);
            context.go(routes[index]);
          },

          items: [
            _item(0, AppAssets.orderNav, AppText.orderNav),
            _item(1, AppAssets.chatNav, AppText.chat),
            _item(2, AppAssets.productNav, AppText.productNav),

            _item(3, AppAssets.addNav, AppText.addProduct),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _item(int index, String icon, String label) {
    return BottomNavigationBarItem(
      icon: CustomImage(
        imageSrc: icon,
        height: ResponsiveHelper.iconSize(24),
        width: ResponsiveHelper.iconSize(24),
        imageColor:
            navController.currentIndexSeller.value == index
                ? AppColors.white
                : AppColors.navUnselectedColor,
      ),
      label: label,
    );
  }
}
