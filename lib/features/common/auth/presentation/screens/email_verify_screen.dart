import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/input_pass_field_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/button/gradient_elevated_button.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';


class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmedPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Widget gap=SizedBox(height:ResponsiveHelper.height(24));
    return Scaffold(
      appBar: CustomAppBar(title: AppText.emailVerify),
      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            children: [


              ///password field
              InputPassFieldWidget(
                title: AppText.password,
                hint: AppText.enterPassword,
                controller: passwordController,
              ),
              gap,
              ///confirmed password field
              InputPassFieldWidget(
                title: AppText.confirmPassword,
                hint: AppText.enterConfirmedPassword,
                controller: confirmedPasswordController,
              ),

              gap,
              gap,
              GradientElevatedButton(title: AppText.resetPassword, onPressed: () {
                context.pushNamed(RoutePath.loginScreen);
              }),

            ],
          ),
        ),
      ),
    );
  }
}
