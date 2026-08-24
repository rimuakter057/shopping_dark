import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/di/injection.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/seller/order/controller/home_controller.dart';
import 'package:home_shopping/features/seller/order/presentation/widgets/home_app_bar.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_divider/custom_divider.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';
import '../../../history/widgets/order_card_widget.dart' show OrderCardWidget;


class OrderSellerScreen extends StatelessWidget {
  const OrderSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final HomeController homeController = Get.find<HomeController>();
    final width = MediaQuery.of(context).size.width;

    print('width===============================$width');
    final Widget gap= SizedBox(height:ResponsiveHelper.height(16),);
    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppBarSeller(
        profileName: "seller",
        profileSubtitle: "Great Falls, Marylan",

        onNotificationTap: () {
          context.pushNamed(RoutePath.notificationScreen);
        },

        onDrawerTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      endDrawer: Drawer(
        backgroundColor: AppColors.black,

        child: _buildDrawer(context),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),

              SizedBox(height: ResponsiveHelper.height(16),),

             ///list of order===============================================================

              Obx(() {
                final selectedIndex = homeController.selectedTabIndex.value;

                return Column(
                  children: [
                    // Tab buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final titles = ['New Order', 'Checking', 'Complete'];
                        final isSelected = selectedIndex == index;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () => homeController.changeIndex(index),
                            child: Column(
                              children: [
                                Text(titles[index], style: context.bodyMedium),
                                SizedBox(height:ResponsiveHelper.height(4),),
                                Container(
                                  height:ResponsiveHelper.height(10),
                                  margin: ResponsiveHelper.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? AppColors.primaryColor
                                            : AppColors.navUnselectedColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(ResponsiveHelper.borderRadius(12),),
                                      topRight: Radius.circular(ResponsiveHelper.borderRadius(12),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    gap,
          if(selectedIndex==0)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(top:ResponsiveHelper.padding(8),),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            OrderCardWidget(
                              orderId: '5435435345345345345345',
                              totalItem: '00$index',
                              totalPrice: '850',
                              date: '06/01/2026',
                              status: AppText.accept,
                              statusBgColor: AppColors.acceptBgColor,
                            ),
                            SizedBox(height:ResponsiveHelper.height(8),),
                          ],
                        );
                      },
                    ),
                    if(selectedIndex==1)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top:ResponsiveHelper.padding(8),),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              OrderCardWidget(
                                orderId: '2222222244',
                                totalItem: '00$index',
                                totalPrice: '850',
                                date: '06/01/2026',
                              ),
                              SizedBox(height: ResponsiveHelper.height(8),),
                            ],
                          );
                        },
                      ),


                    if(selectedIndex==2)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: ResponsiveHelper.padding(8),),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              OrderCardWidget(
                                orderId: '5435435345345345345345',
                                totalItem: '00$index',
                                totalPrice: '850',
                                date: '06/01/2026',
                                status: AppText.completed,
                                statusBgColor: AppColors.completedBgColor,
                              ),
                              SizedBox(height:ResponsiveHelper.height(8),),
                            ],
                          );
                        },
                      ),

                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }



  ///drawer==================================================
  Column _buildDrawer(BuildContext context) {
    final Widget gap= SizedBox(height:ResponsiveHelper.height(16),);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  ResponsiveHelper.all(16.0),
          child: SizedBox(
            height: ResponsiveHelper.height(150),
            child: CustomImage(imageSrc: AppAssets.userLoginImage),
          ),
        ),





        const CustomDivider(color: AppColors.dividerColor),

        Padding(
          padding:  ResponsiveHelper.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDrawerTitle(
                context,
                title: AppText.history,
                onTap: () {
                  context.pushNamed(RoutePath.historySellerScreen);
                },
              ),
              gap,

              _buildDrawerTitle(
                context,
                title: AppText.termsAndConditions,
                onTap: () {
                  context.pushNamed(RoutePath.termsOfConditionScreen);
                },
              ),
              gap,
              _buildDrawerTitle(
                context,
                title: AppText.privacyPolicy,
                onTap: () {
                  context.pushNamed(RoutePath.privacyPolicyScreen);
                },
              ),

              gap,
              _buildDrawerTitle(
               context,
                 title: AppText.profile,
                onTap: () {
                  context.pushNamed(RoutePath.profileSellerScreen);
                 },
              ),
              gap,
              _buildDrawerTitle(
                context,
                title: AppText.createBrand,
                onTap: () {
                  context.pushNamed(RoutePath.profileScreen);
                },
              ),
              gap,
              _buildDrawerTitle(context, title: AppText.logOut, onTap: () {
                context.pushNamed(RoutePath.loginScreen);
              }),

            ],
          ),
        ),
      ],
    );
  }

  ///drawer title=============================================================================
  GestureDetector _buildDrawerTitle(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(title, style: context.titleLarge),
    );
  }






}
