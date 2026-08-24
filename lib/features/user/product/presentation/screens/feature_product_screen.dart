
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/title_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_category_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_product_card_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:home_shopping/utils/app_const/app_const.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';





class FeatureProductScreen extends StatelessWidget {
  const FeatureProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final gap= SizedBox(height: ResponsiveHelper.spacing(16));
    return Scaffold(

      appBar: CustomAppBar(title: AppText.featureProducts),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              gap,
              ///select category=======================================================
              TitleWidget(title: AppText.selectCategory),
                gap,

              SizedBox(
                height:ResponsiveHelper.height(50),

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return         Padding(
                      padding:  ResponsiveHelper.symmetric(horizontal:4),
                      child: Container(
                        padding: ResponsiveHelper.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(30)),
                          gradient: AppColors.buttonGradient,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.directions_run, color: AppColors.white, size: ResponsiveHelper.iconSize(20)),
                            SizedBox(width: ResponsiveHelper.spacing(8)),
                            Text(
                              "Shoes",
                              style: GoogleFonts.poppins(color: AppColors.white, fontSize: ResponsiveHelper.fontSize(16)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

                gap,
              ///select brand=======================================================
              TitleWidget(title: AppText.selectBrand),
              SizedBox(height: ResponsiveHelper.spacing(8)),
              ///category home================================================
              HomeCategoryWidget(image:AppConstant.shirtNetworkImage, name: 'Starbucks',),
              SizedBox(height: ResponsiveHelper.spacing(4)),
              TitleWidget(title: AppText.exclusive),
              ///product home card======================================
                gap,

              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.74,
                ),
                itemBuilder: (context, index) {
                  return HomeProductCardWidget();
                },
              ),



            ],),
        ),
      ),

    );
  }
}

