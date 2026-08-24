import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_app_bar.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/tab/body_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_divider/custom_divider.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/config/app_config.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,

        /// APP BAR
        appBar: HomeAppBar(
          profileName: "user",
          profileSubtitle: "Great Falls, Marylan",
          onNotificationTap: () {
            context.pushNamed(RoutePath.notificationScreen);
          },
          onDrawerTap: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        ),

        /// DRAWER
        endDrawer: Drawer(
          backgroundColor: AppColors.drawerBgColor,
          child: _buildDrawer(context),
        ),

        /// BODY
        body: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// SEARCH
              CustomSearchBar(),

              SizedBox(height: ResponsiveHelper.spacing(12)),

              /// TAB BAR
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.borderRadius(30),
                  ),
                  color: AppColors.drawerBgColor.withOpacity(0.3),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  labelStyle: context.bodyLarge,
                  unselectedLabelStyle: context.bodyMedium,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding:
                  ResponsiveHelper.symmetric(horizontal: 16),

                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.only(
                      topLeft:
                      Radius.circular(ResponsiveHelper.borderRadius(6)),
                      topRight:
                      Radius.circular(ResponsiveHelper.borderRadius(6)),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: ResponsiveHelper.width(4),
                    ),
                  ),

                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: Colors.grey,

                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImage(
                            imageSrc: AppAssets.zegifyImage,
                            height: ResponsiveHelper.iconSize(18),
                            width: ResponsiveHelper.iconSize(18),
                          ),
                          SizedBox(width: ResponsiveHelper.width(8)),
                          const Text("Zegify"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImage(
                            imageSrc: AppAssets.zetroTechImage,
                            height: ResponsiveHelper.iconSize(18),
                            width: ResponsiveHelper.iconSize(18),
                          ),
                          SizedBox(width: ResponsiveHelper.width(8)),
                          const Text("Ztro Tech"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: ResponsiveHelper.spacing(12)),

              /// TAB CONTENT
              const Expanded(
                child: TabBarView(
                  children: [
                    HomeBodyWidget(),
                    HomeBodyWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// DRAWER
  Column _buildDrawer(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.spacing(16));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ResponsiveHelper.all(16),
          child: SizedBox(
            height: ResponsiveHelper.height(250),
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: CustomImage(imageSrc: AppAssets.appLogoImage),
            ),
          ),
        ),

        const CustomDivider(color: AppColors.dividerColor),

        Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _drawerItem(context, AppText.myOrder, RoutePath.orderScreen),
              gap,
              _drawerItem(context, AppText.history, RoutePath.historyScreen),
              gap,
              _drawerItem(
                  context, AppText.privacyPolicy, RoutePath.privacyPolicyScreen),
              gap,
              _drawerItem(context, AppText.termsAndConditions,
                  RoutePath.termsOfConditionScreen),
              gap,
              _drawerItem(context, AppText.profile, RoutePath.profileScreen),
              gap,
              _drawerItem(context, AppText.logOut, RoutePath.loginScreen),
            ],
          ),
        ),
      ],
    );
  }

  /// DRAWER ITEM
  GestureDetector _drawerItem(
      BuildContext context, String title, String route) {
    return GestureDetector(
      onTap: () => context.pushNamed(route),
      child: Text(title, style: context.titleLarge),
    );
  }
}