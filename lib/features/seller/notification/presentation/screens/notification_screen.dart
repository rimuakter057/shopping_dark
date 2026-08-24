import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // ❗ flutter_html import

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/config/app_config.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.notifications),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: ResponsiveHelper.symmetric(horizontal: 8, vertical: 3),
            child: CustomContainer(
              width: double.infinity,
              backgroundColor: AppColors.containerGreyBgColor.withAlpha(48),
              padding: ResponsiveHelper.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Razco Food reply on your feedback",
                    style: context.bodyMedium,
                  ),
                  SizedBox(height: ResponsiveHelper.height(20),),
                  Text(
                    "Razco Food reply on your feedback Razco Food reply on your feedback Razco Food reply on your feedback Razco Food reply on your feedback",
                    style: context.bodySmall,
                  ),
                  SizedBox(height: ResponsiveHelper.height(12),),
                  Text(
                    "20-Dec-2024, 3:00 PM",
                    style: context.bodySmall.copyWith(
                      color: AppColors.timeNotificationColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
