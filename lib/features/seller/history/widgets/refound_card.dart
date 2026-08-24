import 'package:flutter/material.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class RefundCardWidget extends StatelessWidget {
  const RefundCardWidget({
    super.key,
    this.widgetHistory,
    required this.orderNo,
    required this.totalProduct,
    required this.price,
    required this.date,

    required this.reason,
  });
  final Widget? widgetHistory;

  final String orderNo;
  final String totalProduct;
  final String price;
  final String reason;
  final String date;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    print('Screen width: $width');

    return CustomContainer(
      backgroundColor: AppColors.containerGreyBgColor.withAlpha(70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${AppText.orderNo}$orderNo",
                      style: context.bodyMedium,
                    ),
                    CustomContainer(
                      //height: width>400? 30.h:38.h,
                      height: ResponsiveHelper.height(38),
                      radius: ResponsiveHelper.borderRadius(50),
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.width(10),
                        vertical: ResponsiveHelper.height(8),
                      ),
                      backgroundColor: AppColors.refundBgColor,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        AppText.refunded,
                        style: context.bodyMedium.copyWith(
                          // fontSize: width>400?12:14,
                          fontSize: ResponsiveHelper.fontSize(14),
                          color: AppColors.hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${AppText.totalProducts}$totalProduct",
                  style: context.bodyMedium,
                ),
                Text(
                  "${AppText.date}\$$date",
                  style: context.bodyMedium.copyWith(
                    color: AppColors.orangeColor,
                  ),
                ),
                Text("${AppText.price}$price", style: context.bodyMedium),
                Text(
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  "${AppText.reason}$reason",
                  style: context.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
