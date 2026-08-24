import 'package:flutter/material.dart';
import 'package:home_shopping/features/common/widgets/small_gradient_outline_button_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/share/widgets/custom_profile_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Nike Epic React"),
      body: Padding(
        padding: ResponsiveHelper.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ResponsiveHelper.spacing(16)),

            ///image ======================================
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(ResponsiveHelper.borderRadius(6)),
              ),
              child: Container(
                height: ResponsiveHelper.height(190),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.productDetailsImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: ResponsiveHelper.spacing(16)),

            /// price text =================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nike Epic React", style: context.titleLarge),
                Text(
                  "\$850",
                  style: context.titleLarge.copyWith(
                    color: AppColors.priceTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: ResponsiveHelper.spacing(16)),

            /// quantity text =================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppText.quantity, style: context.bodyLarge),
                Row(
                  children: [
                    CustomContainer(
                      padding: ResponsiveHelper.symmetric(
                        horizontal: 13,
                        vertical: 4,
                      ),
                      backgroundColor: AppColors.containerGreyBgColor,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text("-", style: context.bodyLarge),
                      ),
                    ),
                    SizedBox(width: ResponsiveHelper.spacing(6)),
                    CustomContainer(
                      padding: ResponsiveHelper.symmetric(
                        horizontal: 13,
                        vertical: 4,
                      ),
                      backgroundColor: AppColors.containerGreyBgColor,
                      child: Text("1", style: context.bodyLarge),
                    ),
                    SizedBox(width: ResponsiveHelper.spacing(6)),
                    CustomContainer(
                      padding: ResponsiveHelper.symmetric(
                        horizontal: 13,
                        vertical: 4,
                      ),
                      backgroundColor: AppColors.containerGreyBgColor,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text("+", style: context.bodyLarge),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: ResponsiveHelper.spacing(16)),
            Text("${AppText.brand}Nike", style: context.bodyMedium),
            SizedBox(height: ResponsiveHelper.spacing(8)),
            Text("${AppText.selectCategory}Shoes", style: context.bodyMedium),
            SizedBox(height: ResponsiveHelper.spacing(8)),
            Text(
              "${AppText.availableSizes}(e.g 7, 8, 9 ,10)",
              style: context.bodyMedium,
            ),
            SizedBox(height: ResponsiveHelper.spacing(8)),
            Text(
              "${AppText.description}Nike Epic React is designed for runners and everyday wear lovers who want lightweight comfort with responsive cushioning. Built with Nike’s innovative React foam, this shoe delivers a soft yet energetic feel with every step, helping reduce fatigue during long runs or daily use",
              style: context.bodyMedium,
            ),
            SizedBox(height: ResponsiveHelper.spacing(16)),
            _buildUserProfile(context),
            SizedBox(height: ResponsiveHelper.spacing(32)),

            _buildUserProfile(context),
            SizedBox(height: ResponsiveHelper.spacing(16)),

            ///  SmallGradientOutlineButtonRow=================================================================
            SmallOutlineGradientButtonRow(
              outlineTitle: AppText.addToCart,
              gradientTitle: AppText.buyNow,

              gradientOnTap: () {},
              outlineOnTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  ///user profile======================================================
  CustomContainer _buildUserProfile(BuildContext context) {
    return CustomContainer(
      padding: ResponsiveHelper.symmetric(horizontal: 16, vertical: 16),
      backgroundColor: AppColors.containerGreyBgColor.withAlpha(48),
      child: Row(
        children: [
          Row(
            children: [
              CustomProfileAvatar(),
              SizedBox(width: ResponsiveHelper.spacing(8)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MD. Ahmed",
                    style: context.titleLarge.copyWith(fontFamily: "Poppins"),
                  ),
                  Text(
                    "Great Falls, Marylan",
                    style: context.bodyMedium.copyWith(
                      fontFamily: "Poppins",
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: CustomContainer(
              padding: ResponsiveHelper.symmetric(horizontal: 12, vertical: 4),
              radius: ResponsiveHelper.borderRadius(24),
              backgroundColor: AppColors.blueColor,
              child: Text(
                AppText.chat,
                style: context.bodyMedium.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
