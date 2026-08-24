import 'package:flutter/material.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';
import 'add_to_cart_button_widget.dart';

class HomeProductCardWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? price;
  final bool isVerified;
  final VoidCallback? onTap;

  const HomeProductCardWidget({
    super.key,
    this.image,
    this.title,
    this.price,
    this.isVerified = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: ResponsiveHelper.width(165), // 🔥 FIXED WIDTH (GLOBAL SAFE)
        child: Card(
          elevation: 0,
          color: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.borderRadius(12),
            ),
          ),
          child: Padding(
            padding: ResponsiveHelper.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// IMAGE SECTION
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        ResponsiveHelper.borderRadius(10),
                      ),
                      child: CustomImage(
                        imageSrc: image ?? AppAssets.productImage,
                        height: ResponsiveHelper.height(110),
                        width: double.infinity,
                      ),
                    ),

                    if (isVerified)
                      Positioned(
                        top: 6,
                        right: 6,
                        child: Container(
                          padding:  ResponsiveHelper.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.verified,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                  ],
                ),

                SizedBox(height: ResponsiveHelper.spacing(8)),

                /// TITLE
                Text(
                  title ?? "Product Name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyLarge,
                ),

                SizedBox(height: ResponsiveHelper.spacing(6)),

                /// PRICE ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppText.price, style: context.bodyLarge),

                    Flexible(
                      child: Text(
                        price ?? "\$0",
                        overflow: TextOverflow.ellipsis,
                        style: context.bodyLarge.copyWith(
                          color: AppColors.priceTextColor,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: ResponsiveHelper.spacing(8)),

                /// BUTTON
                Center(
                  child: AddToCartButtonWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}