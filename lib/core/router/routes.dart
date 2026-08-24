
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/enum/role.dart';

import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/auth/presentation/screens/email_verify_screen.dart';
import 'package:home_shopping/features/common/auth/presentation/screens/forgot_password_screen.dart';
import 'package:home_shopping/features/common/auth/presentation/screens/login_screen.dart';
import 'package:home_shopping/features/common/auth/presentation/screens/sign_up_screen.dart';
import 'package:home_shopping/features/common/auth/presentation/screens/verify_code.dart';
import 'package:home_shopping/features/common/auth/presentation/screens/selected_screen.dart';
import 'package:home_shopping/features/common/splash/splash_screen.dart';
import 'package:home_shopping/features/seller/cart/presentation/screens/cart_details_screen.dart';
import 'package:home_shopping/features/seller/cart/presentation/screens/payment_screen.dart';
import 'package:home_shopping/features/seller/chat/presentation/screens/chat_inbox_screen.dart';
import 'package:home_shopping/features/seller/chat/presentation/screens/chat_screen.dart';
import 'package:home_shopping/features/seller/doc/presentation/screens/add_document_screen.dart';
import 'package:home_shopping/features/seller/main_nav_bar/presentation/screens/seller_nav_bar.dart';
import 'package:home_shopping/features/seller/history/presentation/screens/history_seller_screen.dart';
import 'package:home_shopping/features/seller/order/presentation/screens/order_seller_screen.dart';
import 'package:home_shopping/features/seller/product/presentation/screens/add_product_screen.dart';
import 'package:home_shopping/features/seller/product/presentation/screens/edit_product_screen.dart';
import 'package:home_shopping/features/seller/product/presentation/screens/exclusive_product_screen.dart';
import 'package:home_shopping/features/seller/product/presentation/screens/feature_product_screen.dart';
import 'package:home_shopping/features/seller/product/presentation/screens/product_details_seller_screen.dart';
import 'package:home_shopping/features/seller/product/presentation/screens/product_seller_screen.dart';
import 'package:home_shopping/features/seller/profile/presentation/screens/edit_profile_screen.dart';
import 'package:home_shopping/features/seller/profile/presentation/screens/profile_seller_screen.dart';
import 'package:home_shopping/features/user/cart/presentation/screens/cart_details_screen.dart';
import 'package:home_shopping/features/user/cart/presentation/screens/cart_screen.dart';
import 'package:home_shopping/features/user/cart/presentation/screens/payment_screen.dart';
import 'package:home_shopping/features/user/chat/presentation/screens/chat_inbox_screen.dart';
import 'package:home_shopping/features/user/chat/presentation/screens/chat_screen.dart';
import 'package:home_shopping/features/user/history/presentation/screens/history_screen.dart';
import 'package:home_shopping/features/user/home/presentation/screens/home_screen.dart';
import 'package:home_shopping/features/user/main_nav_bar/main_nav_bar.dart';
import 'package:home_shopping/features/user/product/presentation/screens/product_details_screen.dart';
import 'package:home_shopping/features/user/notification/presentation/screens/notification_screen.dart';
import 'package:home_shopping/features/user/order/presentation/screens/order_screen.dart';
import 'package:home_shopping/features/user/privacyPolicy/presentation/screens/privacy_policy_screen.dart';
import 'package:home_shopping/features/user/product/presentation/screens/exclusive_product_screen.dart';
import 'package:home_shopping/features/user/product/presentation/screens/feature_product_screen.dart';
import 'package:home_shopping/features/user/product/presentation/screens/product_screen.dart';
import 'package:home_shopping/features/user/profile/presentation/screens/edit_profile_screen.dart';
import 'package:home_shopping/features/user/profile/presentation/screens/profile_screen.dart';
import 'package:home_shopping/features/user/terms_condition/presentation/screens/terms_condition_screen.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';
class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.splashScreen.addBasePath,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    routes: [
      ///======================= Initial Route =======================
      GoRoute(
        name: RoutePath.splashScreen,
        path: RoutePath.splashScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const SplashScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.selectedScreen,
        path: RoutePath.selectedScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  SelectedScreen(),
            state: state,
          );
        },
      ),

      ///======================= auth Route =======================
      GoRoute(
        name: RoutePath.loginScreen,
        path: RoutePath.loginScreen.addBasePath,
        pageBuilder: (context, state) {
          final role = state.extra as String? ?? UserRole.user.value;
          return _buildPageWithAnimation(
            child:  LoginScreen(role: role,),
            state: state,
          );
        },
      ),


      GoRoute(
        name: RoutePath.signUpScreen,
        path: RoutePath.signUpScreen.addBasePath,
        pageBuilder: (context, state) {
          final role=state.extra as String? ??UserRole.user.value;
          return _buildPageWithAnimation(
            child:  SignUpScreen(role: role,),
            state: state,
          );
        },
      ),


      GoRoute(
        name: RoutePath.addDocumentScreen,
        path: RoutePath.addDocumentScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  AddDocumentScreen(),
            state: state,
          );
        },
      ),


      GoRoute(
        name: RoutePath.forgotPassScreen,
        path: RoutePath.forgotPassScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ForgotPasswordScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.verifyCodeScreen,
        path: RoutePath.verifyCodeScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  VerifyCodeScreen(),
            state: state,
          );
        },
      ),


      GoRoute(
        name: RoutePath.verifyEmailScreen,
        path: RoutePath.verifyEmailScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  VerifyEmailScreen(),
            state: state,
          );
        },
      ),




      ///======================= User Bottom Navbar user =======================
      ShellRoute(
        builder: (context, state, child) {
          return MainNavBar(child: child); // 👈 Navbar wrapper
        },
        routes: [

          ///home route=========================================================
          GoRoute(
            name: RoutePath.homeScreen,
            path: RoutePath.homeScreen.addBasePath,
            pageBuilder: (context, state) {
              return _buildPageWithAnimation(
                child:  HomeScreen(),
                state: state,
              );
            },
          ),

          ///======================= cart Route =======================
          GoRoute(
            name: RoutePath.cartScreen,
            path: RoutePath.cartScreen.addBasePath,
            pageBuilder: (context, state) {
              return _buildPageWithAnimation(
                child:  CartScreen(),
                state: state,
              );
            },
          ),
          ///product route=========================================================
          GoRoute(
            name: RoutePath.productScreen,
            path: RoutePath.productScreen.addBasePath,
            pageBuilder: (context, state) {
              return _buildPageWithAnimation(
                child:  ProductScreen(),
                state: state,
              );
            },
          ),


          ///chat route=========================================================

          GoRoute(
            name: RoutePath.chatScreen,
            path: RoutePath.chatScreen.addBasePath,
            pageBuilder: (context, state) {
              return _buildPageWithAnimation(
                child:  ChatScreen(),
                state: state,
              );
            },
          ),

          ///order route=========================================================

          GoRoute(
            name: RoutePath.orderScreen,
            path: RoutePath.orderScreen.addBasePath,
            pageBuilder: (context, state) {
              return _buildPageWithAnimation(
                child:  OrderScreen(),
                state: state,
              );
            },
          ),

        ],
      ),



      ///======================= Seller Bottom Navbar =======================
      ShellRoute(
        builder: (context, state, child) {
          return SellerNavBar(child: child);
        },
        routes: [

          GoRoute(
            name: RoutePath.orderSellerScreen,
            path: RoutePath.orderSellerScreen.addBasePath,
            pageBuilder: (context, state) =>
                _buildPageWithAnimation(
                  child: OrderSellerScreen(),
                  state: state,
                ),
          ),

          ///chat route=========================================================

          GoRoute(
            name: RoutePath.chatSellerScreen,
            path: RoutePath.chatSellerScreen.addBasePath,
            pageBuilder: (context, state) {
              return _buildPageWithAnimation(
                child:  ChatSellerScreen(),
                state: state,
              );
            },
          ),

          GoRoute(
            name: RoutePath.productSellerScreen,
            path: RoutePath.productSellerScreen.addBasePath,
            pageBuilder: (context, state) =>
                _buildPageWithAnimation(
                  child: ProductSellerScreen(),
                  state: state,
                ),
          ),


          GoRoute(
            name: RoutePath.addProductScreen,
            path: RoutePath.addProductScreen.addBasePath,
            pageBuilder: (context, state) =>
                _buildPageWithAnimation(
                  child: AddProductSellerScreen(),
                  state: state,
                ),
          ),


        ],
      ),



///===========================other screens=============================

      ///chat route=========================================================

      GoRoute(
        name: RoutePath.chatInboxScreen,
        path: RoutePath.chatInboxScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ChatInboxScreen(),
            state: state,
          );
        },
      ),



      GoRoute(
        name: RoutePath.chatInboxSellerScreen,
        path: RoutePath.chatInboxSellerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ChatInboxSellerScreen(),
            state: state,
          );
        },
      ),


///cart================================

      GoRoute(
        name: RoutePath.paymentScreen,
        path: RoutePath.paymentScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PaymentScreen(),
            state: state,
          );
        },
      ),


      GoRoute(
        name: RoutePath.paymentSellerScreen,
        path: RoutePath.paymentSellerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PaymentSellerScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.cartDetailsScreen,
        path: RoutePath.cartDetailsScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  CartDetailsScreen(),
            state: state,
          );
        },
      ),


      GoRoute(
        name: RoutePath.cartDetailsSellerScreen,
        path: RoutePath.cartDetailsSellerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  CartDetailsSellerScreen(),
            state: state,
          );
        },
      ),

      ///======================= profile Route =======================

      GoRoute(
        name: RoutePath.profileScreen,
        path: RoutePath.profileScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ProfileScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.profileSellerScreen,
        path: RoutePath.profileSellerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ProfileSellerScreen(),
            state: state,
          );
        },
      ),




      GoRoute(
        name: RoutePath.editProfileScreen,
        path: RoutePath.editProfileScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  EditProfileScreen(),
            state: state,
          );
        },
      ),


      GoRoute(
        name: RoutePath.editProfileSellerScreen,
        path: RoutePath.editProfileSellerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  EditProfileSellerScreen(),
            state: state,
          );
        },
      ),


      ///product route=========================================================
      GoRoute(
        name: RoutePath.productDetailsScreen,
        path: RoutePath.productDetailsScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ProductDetailsScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.productDetailsSellerScreen,
        path: RoutePath.productDetailsSellerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ProductDetailsSellerScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.exclusiveProductScreen,
        path: RoutePath.exclusiveProductScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ExclusiveProductScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.exclusiveProductSellerScreen,
        path: RoutePath.exclusiveProductSellerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ExclusiveProductSellerScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.featureProductScreen,
        path: RoutePath.featureProductScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  FeatureProductScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.featureProductSellerScreen,
        path: RoutePath.featureProductSellerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  FeatureProductSellerScreen(),
            state: state,
          );
        },
      ),


      GoRoute(
        name: RoutePath.historySellerScreen,
        path: RoutePath.historySellerScreen.addBasePath,
        pageBuilder: (context, state) =>
            _buildPageWithAnimation(
              child: HistorySellerScreen(),
              state: state,
            ),
      ),



      GoRoute(
        name: RoutePath.historyScreen,
        path: RoutePath.historyScreen.addBasePath,
        pageBuilder: (context, state) =>
            _buildPageWithAnimation(
              child: HistoryScreen(),
              state: state,
            ),
      ),





      GoRoute(
        name: RoutePath.editProductScreen,
        path: RoutePath.editProductScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  EditProductSellerScreen(),
            state: state,
          );
        },
      ),


      ///doc===================================

      GoRoute(
        name: RoutePath.termsOfConditionScreen,
        path: RoutePath.termsOfConditionScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  TermsConditionScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.privacyPolicyScreen,
        path: RoutePath.privacyPolicyScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PrivacyPolicyScreen(),
            state: state,
          );
        },
      ),
      ///notification=============================================================
      GoRoute(
        name: RoutePath.notificationScreen,
        path: RoutePath.notificationScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  NotificationScreen(),
            state: state,
          );
        },
      ),




    ],
  );







  static CustomTransitionPage _buildPageWithAnimation({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static GoRouter get route => initRoute;
}
