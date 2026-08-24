import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';


class AddToCartButtonWidget extends StatelessWidget {
  const AddToCartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius:  ResponsiveHelper.borderRadius(50),
      padding: ResponsiveHelper.symmetric(horizontal: 24, vertical: 6),
      backgroundColor: AppColors.tealColor,
      child: Text(
        AppText.addToCart,
        style: context.bodyMedium,
      ),
    );
  }
}
