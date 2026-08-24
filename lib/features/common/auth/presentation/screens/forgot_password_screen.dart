import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/forgot-code_heading_widget.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/input_field_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/button/gradient_elevated_button.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';


class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.forgotPasswordTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            children: [

              ForgotCodeHeadingWidget(title: AppText.forgotPasswordTitle, subtitle:AppText.forgotPasswordSubtitle,),


              SizedBox(height: ResponsiveHelper.height(64)),
              ///email field
              InputFieldWidget(
                title: AppText.enterYourEmail,
                hint: AppText.enterEmail,
                controller: emailController,
              ),
                  SizedBox(height: ResponsiveHelper.height(120),),
              GradientElevatedButton(title: AppText.sendResetCode, onPressed: () {
                context.pushNamed(RoutePath.verifyCodeScreen);
              }),

            ],
          ),
        ),
      ),
    );
  }
}


