// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:home_shopping/core/enum/role.dart';
// import 'package:home_shopping/core/router/route_path.dart';
// import 'package:home_shopping/core/service/datasource/local/local_service.dart';
// import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
// import 'package:home_shopping/utils/app_assets/app_assets.dart';
// import 'package:home_shopping/utils/extension/base_extension.dart';
//
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//
//     _clearOldDataAndNavigate();
//   }
//
//   Future<void> _clearOldDataAndNavigate() async {
//     final localService = LocalService();
//
//
//     await localService.logOut();
//     await _handleNavigation();
//   }
//
// Future<void> _handleNavigation() async {
//   await Future.delayed(Duration(seconds: 2));
//
//   final localService = LocalService();
//   final token = await localService.getToken();
//
//   if(token.isEmpty){
//     context.goNamed(RoutePath.selectedScreen);
//     return;
//   }
//
//   final roleString = await localService.getRole();
//   final role = UserRole.values.firstWhere(
//     (e) => e.value == roleString,
//     orElse: () => UserRole.user, // default
//   );
//
//   context.go(role.homeRoute);
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CustomImage(imageSrc: AppAssets.appLogoImage),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/enum/role.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/core/service/datasource/local/local_service.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/color/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await _controller.forward();  // Zoom In
    await _controller.reverse();  // Zoom Out
    await _clearOldDataAndNavigate();
  }

  Future<void> _clearOldDataAndNavigate() async {
    final localService = LocalService();

    await localService.logOut();
    await _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    final localService = LocalService();
    final token = await localService.getToken();

    if (!mounted) return;

    if (token.isEmpty) {
      context.goNamed(RoutePath.selectedScreen);
      return;
    }

    final roleString = await localService.getRole();
    final role = UserRole.values.firstWhere(
          (e) => e.value == roleString,
      orElse: () => UserRole.user,
    );

    context.go(role.homeRoute);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black
      ,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: CustomImage(
            imageSrc: AppAssets.userLoginImage,
          ),
        ),
      ),
    );
  }
}