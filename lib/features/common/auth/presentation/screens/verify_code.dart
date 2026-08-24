import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/forgot-code_heading_widget.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/otp_field_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/button/gradient_elevated_button.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';


class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.emailVerify),
      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            children: [

              ForgotCodeHeadingWidget(title: AppText.enterVerificationCode, subtitle:AppText.verificationSent,),


              SizedBox(height: ResponsiveHelper.height(64) ,),
              ///otp field==========================================
              OtpFieldWidget(
                controller: _otpController,
                onCompleted: (value) {
                  debugPrint("OTP Completed: $value");
                },
              ),
              SizedBox(height: ResponsiveHelper.height(120) ,),
              GradientElevatedButton(title: AppText.verify, onPressed: () {
                context.pushNamed(RoutePath.verifyEmailScreen);
              }),

            ],
          ),
        ),
      ),
    );
  }
}


