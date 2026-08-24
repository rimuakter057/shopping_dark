import 'package:flutter/material.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/input_field_widget.dart';
import 'package:home_shopping/features/common/widgets/small_gradient_outline_button_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class EditProfileSellerScreen extends StatelessWidget {
  EditProfileSellerScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.spacing(24));
    return Scaffold(
      appBar: CustomAppBar(title: AppText.editProfile),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            children: [
              // _buildEditProfile(),
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
              Column(
                children: [
                  ///name field
                  InputFieldWidget(
                    title: AppText.fullName,
                    hint: AppText.enterFullName,
                    controller: nameController,
                  ),
                  gap,

                  ///email field
                  InputFieldWidget(
                    title: AppText.email,
                    hint: AppText.enterEmail,
                    controller: emailController,
                  ),
                  gap,

                  ///phone field
                  InputFieldWidget(
                    title: AppText.phoneNumber,
                    hint: AppText.enterPhone,
                    controller: emailController,
                  ),
                  gap,
                  InputFieldWidget(
                    title: AppText.address,
                    hint: AppText.enterAddress,
                    controller: addressController,
                  ),

                  gap,
                  gap,
                  gap,

                  ///  SmallGradientOutlineButtonRow=================================================================
                  SmallOutlineGradientButtonRow(
                    outlineTitle: AppText.cancel,
                    gradientTitle: AppText.save,

                    gradientOnTap: () {},
                    outlineOnTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
