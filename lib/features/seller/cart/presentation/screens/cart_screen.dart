import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/widgets/cart/add_to_cart_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/button/gradient_elevated_button.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class CartSellerScreen extends StatelessWidget {
  CartSellerScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmedPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.addToCart),
      body: Padding(
        padding: ResponsiveHelper.all(16),
        child: ListView(
          children: [
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    AddToCartWidget(
                      title: "Nike Epic React",
                      price: '850',
                      onTapDetails: () {
                        context.pushNamed(RoutePath.cartDetailsScreen);
                      },
                      onTapIncrement: () {},
                      onTapDecrement: () {},
                      image: AppAssets.appLogoImage,
                    ),
                    SizedBox(height: ResponsiveHelper.height(8)),
                  ],
                );
              },
            ),

            SizedBox(height: ResponsiveHelper.height(16)),

            /// total amount text===============================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppText.totalAmount, style: context.titleLarge),
                Text(
                  "\$850",
                  style: context.titleLarge.copyWith(
                    color: AppColors.priceTextColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: ResponsiveHelper.height(72)),
            GradientElevatedButton(title: AppText.orderNow, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
