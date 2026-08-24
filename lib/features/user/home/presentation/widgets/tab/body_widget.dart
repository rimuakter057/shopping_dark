import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/title_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_category_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_product_card_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/utils/app_const/app_const.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/config/app_config.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  final int parentIndex=0;
  final int categoryIndex=0;
  final int brandIndex=0;


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        SizedBox(height: ResponsiveHelper.spacing(16)),

        /// CATEGORY
        TitleWidget(title: AppText.selectCategory),

        SizedBox(height: ResponsiveHelper.spacing(16)),

        SizedBox(
          height: ResponsiveHelper.height(50),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: ResponsiveHelper.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    padding: ResponsiveHelper.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(ResponsiveHelper.borderRadius(30)),
                      gradient: AppColors.buttonGradient,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.directions_run, color: Colors.white),
                        SizedBox(width: ResponsiveHelper.spacing(8)),
                        Text("Shoes", style: context.bodyLarge),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: ResponsiveHelper.spacing(24)),

        /// BRAND
        TitleWidget(title: AppText.selectBrand),

        SizedBox(height: ResponsiveHelper.spacing(8)),

        GestureDetector(
          onTap: (){},
          child: HomeCategoryWidget(
            image: AppConstant.shirtNetworkImage,
            name: 'Starbucks',
          ),
        ),

        SizedBox(height: ResponsiveHelper.spacing(24)),

        /// EXCLUSIVE
        _title(context, AppText.exclusive, RoutePath.exclusiveProductScreen),

        SizedBox(height: ResponsiveHelper.spacing(8)),

        SizedBox(
          height: ResponsiveHelper.height(240),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const HomeProductCardWidget(isVerified: true);
            },
          ),
        ),

        SizedBox(height: ResponsiveHelper.spacing(24)),

        /// FEATURE
        _title(context, AppText.featureProduct, RoutePath.featureProductScreen),

        SizedBox(height: ResponsiveHelper.spacing(8)),

        SizedBox(
          height: ResponsiveHelper.height(240),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const HomeProductCardWidget();
            },
          ),
        ),

        SizedBox(height: ResponsiveHelper.spacing(40)),
      ],
    );
  }

  /// SECTION TITLE
  Row _title(BuildContext context, String title, String route) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.titleLarge),
        GestureDetector(
          onTap: () => context.pushNamed(route),
          child: Text(
            AppText.viewAll,
            style: TextStyle(
              fontFamily: AppConfig.questrial,
              fontSize: ResponsiveHelper.fontSize(12),
              color: AppColors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}