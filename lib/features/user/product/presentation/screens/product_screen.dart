import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/title_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_category_widget.dart';
import 'package:home_shopping/features/user/home/presentation/widgets/home_product_card_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:home_shopping/utils/app_const/app_const.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {

    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(title: Text(AppText.allProducts)),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              SizedBox(height: ResponsiveHelper.spacing(16)),
              TitleWidget(title: AppText.selectCategory),
              SizedBox(height: ResponsiveHelper.spacing(4)),
              ///category home================================================
              HomeCategoryWidget(image: AppConstant.coffeeNet, name: 'Starbucks'),
              SizedBox(height: ResponsiveHelper.spacing(4)),
              TitleWidget(title: AppText.exclusive),
              SizedBox(height: ResponsiveHelper.spacing(4)),
              ///product home card======================================
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(RoutePath.productDetailsSellerScreen);
                    },
                    child: HomeProductCardWidget(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
