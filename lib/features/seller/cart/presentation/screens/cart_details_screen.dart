import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/button/gradient_elevated_button.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class CartDetailsSellerScreen extends StatelessWidget {
  const CartDetailsSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.addToCart),
      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16.0),
          child: Column(
            children: [
              ///details cart====================================
              _buildDeliveryDetails(context),
              SizedBox(height: ResponsiveHelper.height(24)),

              ///price=============================================================================================
              _buildRowPrice(
                context,
                title: AppText.subTotal,
                price: "\$715.00",
              ),
              SizedBox(height: ResponsiveHelper.height(8)),
              _buildRowPrice(
                context,
                title: AppText.deliveryFee,
                price: "\$56.00",
              ),
              SizedBox(height: ResponsiveHelper.height(8)),

              ///divider=============================================================================================
              Divider(color: AppColors.dividerColor),
              SizedBox(height: ResponsiveHelper.height(8)),

              /// total price text=============================================================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppText.total,
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(4)),
                  Text(
                    "\$771.00",
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: ResponsiveHelper.height(220)),

              /// button=============================================================================================
              GradientElevatedButton(
                title: AppText.checkOut,
                onPressed: () {
                  context.pushNamed(RoutePath.paymentScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///price====================================================================================================
  Row _buildRowPrice(
    BuildContext context, {
    required String title,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.bodyMedium.copyWith(color: AppColors.white)),
        SizedBox(height: ResponsiveHelper.height(8)),
        Text(price, style: context.bodyMedium.copyWith(color: AppColors.white)),
      ],
    );
  }

  ///details cart=========================================================================================================
  CustomContainer _buildDeliveryDetails(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.cartDetailsConColor,
      width: double.infinity,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///delivery address edit================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppText.deliveryAddress, style: context.titleLarge),

              ///edit address============================================
              GestureDetector(
                onTap: () {},
                child: CustomContainer(
                  backgroundColor: AppColors.containerGreyBgColor,

                  child: Text(AppText.editAddress, style: context.titleLarge),
                ),
              ),
            ],
          ),

          SizedBox(height: ResponsiveHelper.height(24)),

          ///details text=============================
          Text(
            "${AppText.nameLabel}152764648488484",
            style: context.bodyMedium.copyWith(
              color: AppColors.cartDetailsTextColor,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(8)),
          Text(
            "${AppText.contactNumber}02",
            style: context.bodyMedium.copyWith(
              color: AppColors.cartDetailsTextColor,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(8)),
          Text(
            "13th Street. 47 W 13th St, New York, NY 10011",
            style: context.bodyMedium.copyWith(
              color: AppColors.cartDetailsTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
