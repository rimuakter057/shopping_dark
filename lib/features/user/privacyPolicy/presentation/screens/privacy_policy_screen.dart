import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // ❗ flutter_html import

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/config/app_config.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  final String privacyDescription = """
    <h1>Privacy Policy</h1>
    <p>This is your privacy policy content. You can write HTML here.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.privacyPolicy),
      body: SingleChildScrollView(
        child: Html(
          data: privacyDescription,
          style: {
            "body": Style(
              fontSize: FontSize(ResponsiveHelper.fontSize(14)),
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
              fontFamily: AppConfig.questrial,
            ),
          },
        ),
      ),
    );
  }
}
