import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/enum/role.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/title_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/button/gradient_elevated_button.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class AddDocumentScreen extends StatelessWidget {
  const AddDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.documentation),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              TitleWidget(title: AppText.uploadDoc),
              SizedBox(height: ResponsiveHelper.height(8)),
              CustomContainer(
                width: double.infinity,
                padding: ResponsiveHelper.symmetric(vertical: 52),
                backgroundColor: AppColors.containerGreyBgColor.withAlpha(48),
                child: Column(
                  children: [
                    CustomImage(imageSrc: AppAssets.upload),
                    SizedBox(height: ResponsiveHelper.height(8)),
                    Text(
                      AppText.uploadHere,
                      style: context.bodyLarge.copyWith(
                        color: AppColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: ResponsiveHelper.height(264)),
              GradientElevatedButton(
                title: AppText.signUp,
                onPressed: () {
                  context.pushNamed(
                    RoutePath.loginScreen,
                    extra: UserRole.seller.value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
