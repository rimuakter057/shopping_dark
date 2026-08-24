import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/title_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class ProductSellerScreen extends StatefulWidget {
  const ProductSellerScreen({super.key});

  @override
  State<ProductSellerScreen> createState() => _ProductSellerScreenState();
}

class _ProductSellerScreenState extends State<ProductSellerScreen> {

  int selectedCategoryIndex = 0;

  List<Map<String, dynamic>> categories = [
    {
      "name": "Shoes",
      "icon": Icons.directions_run,
    },
    {
      "name": "Watch",
      "icon": Icons.watch,
    },
    {
      "name": "Bag",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Phone",
      "icon": Icons.phone_android,
    },
  ];

  Map<String, List<Map<String, dynamic>>> productData = {

    "Shoes": [

      {
        "name": "Nike Epic React",
        "price": 850,
        "image": AppAssets.productImage,
      },

      {
        "name": "Adidas Runner",
        "price": 650,
        "image": AppAssets.productImage,
      },

      {
        "name": "Nike Epic React",
        "price": 850,
        "image": AppAssets.productImage,
      },

      {
        "name": "Adidas Runner",
        "price": 650,
        "image": AppAssets.productImage,
      },
      {
        "name": "Nike Epic React",
        "price": 850,
        "image": AppAssets.productImage,
      },

      {
        "name": "Adidas Runner",
        "price": 650,
        "image": AppAssets.productImage,
      },

      {
        "name": "Nike Epic React",
        "price": 850,
        "image": AppAssets.productImage,
      },

      {
        "name": "Adidas Runner",
        "price": 650,
        "image": AppAssets.productImage,
      },


    ],

    "Watch": [

      {
        "name": "Apple Watch",
        "price": 1200,
        "image": AppAssets.productImage,
      },

    ],

    "Bag": [

      {
        "name": "Office Bag",
        "price": 400,
        "image": AppAssets.productImage,
      },

    ],


    "Phone": [

      {
        "name": "Nike Epic React",
        "price": 850,
        "image": AppAssets.productImage,
      },

      {
        "name": "Adidas Runner",
        "price": 650,
        "image": AppAssets.productImage,
      },

      {
        "name": "Nike Epic React",
        "price": 850,
        "image": AppAssets.productImage,
      },

      {
        "name": "Adidas Runner",
        "price": 650,
        "image": AppAssets.productImage,
      },
      {
        "name": "Nike Epic React",
        "price": 850,
        "image": AppAssets.productImage,
      },

      {
        "name": "Adidas Runner",
        "price": 650,
        "image": AppAssets.productImage,
      },

      {
        "name": "Nike Epic React",
        "price": 850,
        "image": AppAssets.productImage,
      },

      {
        "name": "Adidas Runner",
        "price": 650,
        "image": AppAssets.productImage,
      },


    ],

  };





  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.spacing(16));
    String selectedCategory =
    categories[selectedCategoryIndex]["name"];

    List<Map<String, dynamic>> currentProducts =
        productData[selectedCategory] ?? [];

// build() এর ভেতরে gap এর আগে add করো
    print("=== DEBUG =====================");
    print("Index:=========== $selectedCategoryIndex");
    print("Category:============== $selectedCategory");
    print("Keys:================ ${productData.keys.toList()}");
    print("Products count=:====================== ${currentProducts.length}");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppText.allProducts,
          style: GoogleFonts.poppins(fontSize: ResponsiveHelper.fontSize(16)),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),

              ///top products=======================================================
              gap,
              TitleWidget(title: AppText.topProducts),
              gap,

              ///top  product=======================================================
              SizedBox(
                height: ResponsiveHelper.height(240),

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ResponsiveHelper.borderRadius(12),
                        ),
                      ),
                      color: AppColors.productBgColor,
                      // 1` color: AppColors.red,
                      child: Padding(
                        padding: ResponsiveHelper.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImage(
                              imageSrc: AppAssets.productImage,
                              height: ResponsiveHelper.height(107),
                              //width: double.infinity,
                            ),

                            SizedBox(height: ResponsiveHelper.spacing(8)),
                            Text(
                              "Nike Epic React",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodyLarge,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppText.price, style: context.bodyLarge),

                                Text(
                                  " \$850",
                                  style: context.bodyLarge.copyWith(
                                    color: AppColors.priceTextColor,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: ResponsiveHelper.spacing(8)),

                            ///buildEditDetailsButton=======================================
                            Row(
                              children: [
                                _buildEditDetailsButton(
                                  title: AppText.edit,
                                  onTap: () {},
                                  context: context,
                                ),
                                SizedBox(width: ResponsiveHelper.spacing(8)),
                                _buildEditDetailsButton(
                                  colorTex: AppColors.hintColor,
                                  title: AppText.topDeals,
                                  colorBg: AppColors.orangeColor,
                                  onTap: () {},
                                  context: context,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),


              ///all products  data get list and selected unselected bgColor text icon  changes

              ///all products=======================================================
              gap,

              TitleWidget(title: AppText.allProducts),
              gap,

              ///all  product=======================================================
              // SizedBox(
              //   height: ResponsiveHelper.height(50),
              //
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 10,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: ResponsiveHelper.symmetric(horizontal: 4),
              //         child: Container(
              //           padding: ResponsiveHelper.symmetric(
              //             horizontal: 20,
              //             vertical: 12,
              //           ),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(30),
              //             gradient: AppColors.buttonGradient,
              //             border: Border.all(
              //               color: AppColors.gradientOne
              //
              //             )
              //           ),
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.directions_run,
              //                 color: AppColors.white,
              //                 size: ResponsiveHelper.iconSize(20),
              //               ),
              //               SizedBox(width: ResponsiveHelper.spacing(8)),
              //               Text(
              //                 "Shoes",
              //                 style: context.bodyLarge.copyWith(color: AppColors.white)
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),



              SizedBox(
                height: ResponsiveHelper.height(50),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {

                    final isSelected = selectedCategoryIndex == index;

                    return GestureDetector(
                      onTap: () {

                        setState(() {

                          selectedCategoryIndex = index;

                        });

                      },
                      child: Padding(
                        padding: ResponsiveHelper.symmetric(horizontal: 4),
                        child: Container(
                          padding: ResponsiveHelper.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            ///selected হলে gradient
                            gradient: isSelected
                                ? AppColors.buttonGradient
                                : null,

                            ///unselected হলে border
                            border: Border.all(
                              color: isSelected
                                  ? Colors.transparent
                                  : AppColors.gradientOne,
                            ),

                            color: isSelected
                                ? null
                                : Colors.transparent,
                          ),
                          child: Row(
                            children: [

                              Icon(
                                categories[index]["icon"],

                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.hintColor,

                                size: ResponsiveHelper.iconSize(20),
                              ),

                              SizedBox(width: ResponsiveHelper.spacing(8)),

                              Text(
                                categories[index]["name"],

                                style: context.bodyLarge.copyWith(

                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.hintColor,

                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),



              gap,

              ///product home card changes with uper product index======================================

              currentProducts.isEmpty
                  ? Center(
                child: Text("No products found",style: context.bodyLarge,),
              )
                  :
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                itemCount: currentProducts.length,

                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: .95,
                ),

                itemBuilder: (context, index) {

                  final product = currentProducts[index];

                  return GestureDetector(

                    onTap: () {

                      context.pushNamed(
                          RoutePath.productDetailsSellerScreen);

                    },

                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ResponsiveHelper.borderRadius(12),
                        ),
                      ),

                      color: AppColors.productBgColor,

                      child: Padding(
                        padding: ResponsiveHelper.all(8.0),

                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            CustomImage(
                              imageSrc: product["image"],

                              height:
                              ResponsiveHelper.height(107),
                            ),

                            SizedBox(
                                height:
                                ResponsiveHelper.spacing(8)),

                            Text(
                              product["name"],

                              maxLines: 1,

                              overflow:
                              TextOverflow.ellipsis,

                              style: context.bodyLarge,
                            ),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,

                              children: [

                                Text(
                                  AppText.price,
                                  style: context.bodyLarge,
                                ),

                                Text(
                                  "\$${product["price"]}",

                                  style: context.bodyLarge
                                      .copyWith(
                                    color: AppColors
                                        .priceTextColor,
                                  ),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                },
              )








            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildEditDetailsButton({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    Color? colorBg,
    Color? colorTex,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        padding: ResponsiveHelper.symmetric(horizontal: 10, vertical: 4),
        radius: ResponsiveHelper.borderRadius(12),
        backgroundColor: colorBg ?? AppColors.tealColor,
        child: Text(
          title,
          style: context.bodyMedium.copyWith(
            color: colorTex ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
