import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/enum/role.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/core/service/datasource/local/local_service.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/action_text_widget.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/input_field_widget.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/input_pass_field_widget.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/remember_forgot_row.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/button/gradient_elevated_button.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class LoginScreen extends StatefulWidget {
  final String role;
  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height:ResponsiveHelper.height(24));
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(title: AppText.login,
      bgColor: AppColors.black,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              ///login image
              Center(
                child: CustomImage(
                  imageSrc: AppAssets.appLogoImage,
                  height: ResponsiveHelper.height(160),
                  width: ResponsiveHelper.width(160),
                ),
              ),
              gap,
              gap,

              ///email field
              InputFieldWidget(
                title: AppText.email,
                hint: AppText.enterEmail,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }

                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$',
                  );

                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Please enter a valid email address';
                  }

                  return null;
                },
              ),
              gap,

              ///password field
              InputPassFieldWidget(
                title: AppText.password,
                hint: AppText.enterPassword,
                controller: passwordController,
              ),
              gap,
              RememberForgotRow(
                rememberMe: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value;
                  });
                },
                onForgotPassword: () {
                  context.pushNamed(RoutePath.forgotPassScreen);
                },
              ),
              gap,
              gap,

              GradientElevatedButton(
                title: AppText.login,
                onPressed: () async {
                  // frontend-only testing: এখন কোন token save করছো না
                  // final localService = LocalService();

                  // --- এখন save করছো না, শুধু comment এ রাখো ---
                  // token, id, refreshToken save করা
                  // await localService.saveUserdata(
                  //   token: "dummy_token",
                  //   refreshToken: "dummy_refresh",
                  //   id: "123",
                  //   role: roleString,
                  // );

                  // Role enum থেকে home route বের করা
                  final userRole = UserRole.values.firstWhere(
                    (e) => e.value == widget.role,
                    orElse: () => UserRole.user, // default
                  );

                  // Navigate to home screen according to role
                  context.go(userRole.homeRoute);
                },
              ),

              SizedBox(height: ResponsiveHelper.height(12) ,),
              ActionTextWidget(
                underlineColor: AppColors.primaryColor,
                prefixText: AppText.dontHaveAccount,
                actionText: AppText.signUp,
                onActionTapped: () {
                  context.pushNamed(RoutePath.signUpScreen,
                  extra: widget.role,
                  );
                },
                isUnderline: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
