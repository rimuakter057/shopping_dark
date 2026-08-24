import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/custom_profile_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class ProfileSellerScreen extends StatelessWidget {
  const ProfileSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.profile),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            children: [
              _buildEditProfile(context),

              SizedBox(height: ResponsiveHelper.spacing(12)),

              Text("Banedict Fring Dron", style: context.titleLarge),
              SizedBox(height: ResponsiveHelper.spacing(4)),
              Text(
                "Great Falls, Marylan",
                style: context.bodyMedium.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),

              SizedBox(height: ResponsiveHelper.spacing(16)),
              _buildDeliveryDetails(context),

              SizedBox(height:  ResponsiveHelper.spacing(16)),
              _buildPdf(context),
            ],
          ),
        ),
      ),
    );
  }
///build pdf======================================================================================
  CustomContainer _buildPdf(BuildContext context) {
    return CustomContainer(
              padding: ResponsiveHelper.all(16),
              backgroundColor: AppColors.cartDetailsConColor,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///details text=============================
                  Text(
                    AppText.documents,
                    style: context.bodyLarge.copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: ResponsiveHelper.spacing(4)),
                  GestureDetector(
                    onTap: () {},
                    child: CustomImage(imageSrc: AppAssets.documentImage),
                  ),
                ],
              ),
            );
  }
///edit profile===================================================================================
  Stack _buildEditProfile(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomProfileAvatar(width:  ResponsiveHelper.iconSize(78), height:  ResponsiveHelper.iconSize(78)),

        /// Edit Button
        GestureDetector(
          onTap: () {
            context.pushNamed(RoutePath.editProfileSellerScreen);
          },
          child: Container(
            padding:  ResponsiveHelper.all(4),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: CustomImage(imageSrc: AppAssets.edit),
          ),
        ),
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
          ///details text=============================
          Text(
            AppText.nameLabel,
            style: context.bodyMedium.copyWith(color: AppColors.white),
          ),
          SizedBox(height: ResponsiveHelper.spacing(4)),
          Text(
            "Cameron Williamson",
            style: context.bodyMedium.copyWith(color: AppColors.white),
          ),
          SizedBox(height:  ResponsiveHelper.spacing(8)),
          Text(
            AppText.addressLabel,
            style: context.bodyMedium.copyWith(color: AppColors.white),
          ),
          SizedBox(height:  ResponsiveHelper.spacing(4)),
          Text(
            "deanna.curtis@example.com",
            style: context.bodyMedium.copyWith(color: AppColors.white),
          ),
          SizedBox(height:  ResponsiveHelper.spacing(8)),
          Text(
            AppText.emailLabel,
            style: context.bodyMedium.copyWith(color: AppColors.white),
          ),
          SizedBox(height:  ResponsiveHelper.spacing(4)),
          Text(
            "Bushwick Brooklyn, NY, USA",
            style: context.bodyMedium.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
