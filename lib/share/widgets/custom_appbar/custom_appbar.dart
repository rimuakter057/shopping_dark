import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? leadingIcon;
  final VoidCallback? onBack;
  final double leadingWidth;
  final double iconSize;
  final Color? bgColor;

  const CustomAppBar({
    super.key,
    required this.title,
  this.leadingIcon,
    this.onBack,
    this.leadingWidth = 48,
    this.iconSize = 30,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor??AppColors.backgroundColor,
      leadingWidth: leadingWidth.w,
      leading: GestureDetector(
        onTap:onBack?? (){
      context.pop();

        },




        child: Center(
          child: CustomImage(
            imageSrc:leadingIcon?? AppAssets.back,
            height: iconSize.h,
            width: iconSize.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        title,
        style: context.titleLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
