import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/config/app_config.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
    required this.title,
    required this.price,
    required this.onTapDetails,
    required this.onTapIncrement,
    required this.onTapDecrement,
    required this.image,
  });

  final String title;
  final String price;
  final VoidCallback onTapDetails;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecrement;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.darkGrey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///images
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  ResponsiveHelper.borderRadius(16),
                ),
                child: CustomImage(
                  imageSrc: image,
                  height: ResponsiveHelper.iconSize(66),
                  width: ResponsiveHelper.iconSize(66),
                ),
              ),
              SizedBox(width: ResponsiveHelper.width(8)),

              ///details
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: ResponsiveHelper.width(128),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "\$$price",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.priceTextColor,
                        fontSize: ResponsiveHelper.fontSize(16),
                        fontFamily: AppConfig.questrial,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapDetails,
                      child: Text(
                        "details...",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(12),
                          fontWeight: FontWeight.w400,
                          fontFamily: AppConfig.questrial,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              AppColors.greyTextColor, // underline color
                          decorationThickness: ResponsiveHelper.height(
                            2,
                          ), // underline width
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          ///number count
          Row(
            children: [
              CustomContainer(
                padding: ResponsiveHelper.symmetric(
                  horizontal: 13,
                  vertical: 4,
                ),
                backgroundColor: AppColors.containerGreyBgColor,
                child: GestureDetector(
                  onTap: onTapDecrement,
                  child: Text("-", style: context.bodyLarge),
                ),
              ),
              SizedBox(width: ResponsiveHelper.width(6)),
              CustomContainer(
                padding: ResponsiveHelper.symmetric(
                  horizontal: 13,
                  vertical: 4,
                ),
                backgroundColor: AppColors.containerGreyBgColor,
                child: Text("1", style: context.bodyLarge),
              ),
              SizedBox(width: ResponsiveHelper.width(6)),
              CustomContainer(
                padding: ResponsiveHelper.symmetric(
                  horizontal: 13,
                  vertical: 4,
                ),
                backgroundColor: AppColors.containerGreyBgColor,
                child: GestureDetector(
                  onTap: onTapIncrement,
                  child: Text("+", style: context.bodyLarge),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
