import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: ResponsiveHelper.height(48),
      width: double.infinity,
      radius: ResponsiveHelper.borderRadius(12),
      backgroundColor: AppColors.searchBarBgColor,
      child: TextField(
        decoration: InputDecoration(
          fillColor: AppColors.searchBarBgColor,
          filled: true,
          hintText: "Search here...", // placeholder text
          hintStyle: context.bodyMedium.copyWith(
            color: AppColors.searchTextColor,
          ),
          prefixIcon: CustomImage(
            imageSrc: AppAssets.search,
            height: ResponsiveHelper.iconSize(20),
            width: ResponsiveHelper.iconSize(20),
            fit: BoxFit.contain,
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: ResponsiveHelper.iconSize(24),
            minWidth: ResponsiveHelper.iconSize(24),
          ),
          contentPadding: ResponsiveHelper.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          // 🔴 ALL BORDERS NONE
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
