import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

import 'add_to_cart_button_widget.dart';


class HomeProductCardWidget extends StatelessWidget {
  const HomeProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( ResponsiveHelper.borderRadius(12),),
      ),
      color: AppColors.productBgColor,
     // 1` color: AppColors.red,
      child: Padding(
        padding:  ResponsiveHelper.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              imageSrc: AppAssets.productImage,
              height: ResponsiveHelper.height(107),
              //width: double.infinity,
            ),

            SizedBox(height:  ResponsiveHelper.height(8),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppText.price, style: context.bodyMedium),
                Text(
                    "\$850",
                    style: context.bodyLarge.copyWith(color: AppColors.priceTextColor)
                ),
              ],
            ),

            SizedBox(height:  ResponsiveHelper.height(8),),
            Center(child: GestureDetector(
                onTap: (){
                  context.pushNamed(RoutePath.cartScreen);

                },
                child: AddToCartButtonWidget())),
          ],
        ),
      ),
    );
  }
}