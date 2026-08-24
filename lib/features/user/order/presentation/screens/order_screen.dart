import 'package:flutter/material.dart';
import 'package:home_shopping/features/seller/history/widgets/order_card_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(title: Text(AppText.runningOrders,
          style: context.titleLarge,
          )),
          body: Padding(
            padding: ResponsiveHelper.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                // Tab Bar
                TabBar(
                  dividerColor: AppColors.backgroundColor,
                  labelStyle: context.bodyMedium,
                  unselectedLabelStyle: context.bodyMedium,
                  indicatorPadding: ResponsiveHelper.symmetric(horizontal: 16),
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        ResponsiveHelper.borderRadius(6),
                      ),
                      topRight: Radius.circular(
                        ResponsiveHelper.borderRadius(6),
                      ),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: ResponsiveHelper.width(8),
                    ),
                  ),

                  indicatorSize: TabBarIndicatorSize.tab,

                  tabs: [
                    Tab(text: AppText.running),
                    Tab(text: AppText.complete),
                  ],
                ),
                // Container(
                //   height: ResponsiveHelper.height(0.2),
                //   color: Colors.grey.shade300,
                // ),
                SizedBox(height: ResponsiveHelper.height(24)),

                // Tab View
                Expanded(
                  child: TabBarView(
                    children: [
                      // Running
                      ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const OrderCardWidget(
                                orderId: '2213214324',
                                totalItem: '02',
                                totalPrice: '850',
                                date: '06/01/2026',
                              ),
                              SizedBox(height: ResponsiveHelper.height(8)),
                            ],
                          );
                        },
                      ),

                      // Complete
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const OrderCardWidget(
                                widgetHistory: Text(AppText.history),
                                orderId: '',
                                totalItem: '',
                                totalPrice: '',
                                date: '',
                              ),
                              SizedBox(height: ResponsiveHelper.height(8)),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
