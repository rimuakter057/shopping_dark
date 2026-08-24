
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/title_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/add_to_cart_button_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_category_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_product_card_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';


import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_const/app_const.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';




class ExclusiveProductSellerScreen extends StatelessWidget {
  const ExclusiveProductSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).size.width );
    return Scaffold(

      appBar: CustomAppBar(title: AppText.exclusiveProducts),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              SizedBox(height: ResponsiveHelper.height(16),),
              ///select category=======================================================
              TitleWidget(title: AppText.selectCategory),
              SizedBox(height: ResponsiveHelper.height(8),),

              SizedBox(
                height:40.h,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return         Padding(
                      padding:  ResponsiveHelper.symmetric(horizontal:4),
                      child: Container(
                        padding: ResponsiveHelper.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(30),),
                          gradient: AppColors.buttonGradient,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.directions_run, color: Colors.white, size: ResponsiveHelper.fontSize(20),),
                            SizedBox(width: ResponsiveHelper.width(8),),
                            Text(
                              "Shoes",
                              style: TextStyle(color: Colors.white, fontSize: ResponsiveHelper.fontSize(16),),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height:ResponsiveHelper.height(16),),
              ///select brand=======================================================
              TitleWidget(title: AppText.selectBrand),
              SizedBox(height:ResponsiveHelper.height(8),),
              ///category home================================================
              HomeCategoryWidget(image:AppConstant.unknown, name: 'Starbucks',),
              SizedBox(height: ResponsiveHelper.height(4),),
              TitleWidget(title: AppText.exclusive),
              ///product home card======================================


              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: (width == 360)
                      ? 0.78
                      : (width > 360)
                      ? 0.78
                      : 0.88,
                ),
                itemBuilder: (context, index) {
                  return HomeProductCardWidget();
                },
              ),

              TitleWidget(title: AppText.featureProduct),


            ],),
        ),
      ),

    );
  }
}

