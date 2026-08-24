import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';




class ForgotCodeHeadingWidget extends StatelessWidget {
  const ForgotCodeHeadingWidget({
    super.key, required this.title, required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:ResponsiveHelper.width(24) ,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
            style: context.titleLarge,
          ),
          SizedBox(height:ResponsiveHelper.height(8) ,),
          Text(subtitle,
            textAlign: TextAlign.center,
            style: context.bodyMedium.copyWith(color: AppColors.subTitleColor),

          ),
        ],
      ),
    );
  }
}