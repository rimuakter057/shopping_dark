import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_shopping/core/di/injection.dart';
import 'package:home_shopping/features/seller/order/controller/home_controller.dart';
import 'package:home_shopping/features/user/order/widgets/order_card_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final HomeController homeController = Get.find<HomeController>();
    final width = MediaQuery.of(context).size.width;

    print('width===============================$width');
    return Scaffold(


          appBar: CustomAppBar(title: AppText.history),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SizedBox(height: ResponsiveHelper.spacing(16)),

              ///list of order===============================================================

              Obx(() {
                final selectedIndex = homeController.selectedTabIndex.value;

                return Column(
                  children: [
                    // Tab buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final titles = ['Complete', 'Refund', 'Cancel'];
                        final isSelected = selectedIndex == index;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () => homeController.changeIndex(index),
                            child: Column(
                              children: [
                                Text(titles[index], style: context.bodyMedium),
                                SizedBox(height: ResponsiveHelper.spacing(4)),
                                Container(
                                  height:ResponsiveHelper.height(10),
                                  margin: ResponsiveHelper.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color:
                                    isSelected
                                        ? AppColors.primaryColor
                                        : AppColors.navUnselectedColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(ResponsiveHelper.borderRadius(12)),
                                      topRight: Radius.circular(ResponsiveHelper.borderRadius(12)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: ResponsiveHelper.spacing(16)),
                    if(selectedIndex==0)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: ResponsiveHelper.padding(8)),
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
                              SizedBox(height:ResponsiveHelper.spacing(8)),
                            ],
                          );
                        },
                      ),
                    if(selectedIndex==1)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: ResponsiveHelper.padding(8)),
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
                              SizedBox(height: ResponsiveHelper.spacing(8)),
                            ],
                          );
                        },
                      ),


                    if(selectedIndex==2)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: ResponsiveHelper.padding(8)),
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
                              SizedBox(height:ResponsiveHelper.spacing(8)),
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









}
