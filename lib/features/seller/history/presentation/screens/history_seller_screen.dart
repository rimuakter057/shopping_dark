import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/features/seller/history/widgets/refound_card.dart';


import 'package:home_shopping/features/user/order/widgets/order_card_widget.dart'
   ;
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class HistorySellerScreen extends StatelessWidget {
  const HistorySellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(title: AppText.runningOrders,
          onBack: (){
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },

        ),
        body: Column(
          children: [
            // Tab Bar
            TabBar(
              dividerColor: Colors.transparent,
              labelStyle: context.bodyMedium,
              unselectedLabelStyle: context.bodyMedium,
              indicatorPadding: ResponsiveHelper.symmetric(horizontal: 16),
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ResponsiveHelper.borderRadius(6)),
                  topRight: Radius.circular(ResponsiveHelper.borderRadius(6)),
                ),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: ResponsiveHelper.width(8)
                ),
              ),

              indicatorSize: TabBarIndicatorSize.tab,

              tabs: [Tab(text: AppText.complete), Tab(text: AppText.refund)],
            ),
            Container(height: ResponsiveHelper.height(0.2), color: Colors.grey.shade300),
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
                            status: AppText.complete,
                            statusBgColor: AppColors.completeBgColor,
                          ),
                          SizedBox(height:ResponsiveHelper.height(8)),
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
                          const RefundCardWidget(
                            date: '07/01/2026',
                            orderNo: '43534534534',
                            totalProduct: '03',
                            price: '455',
                            reason:
                                "Reason:  simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
                          ),
                          SizedBox(height:ResponsiveHelper.height(8)),
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
    );
  }
}
