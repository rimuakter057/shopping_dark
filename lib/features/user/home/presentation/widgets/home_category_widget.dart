import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/utils/app_const/app_const.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    super.key, required this.image, required this.name,
  });
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveHelper.height(100),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,

        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right:ResponsiveHelper.padding(8)),
            child: Column(
              children: [
                Container(
                  width:ResponsiveHelper.width(67),
                  height: ResponsiveHelper.width(67),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.greyTextColor,
                      width: ResponsiveHelper.width(1.5),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


                SizedBox(height: ResponsiveHelper.height(4)),
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: context.bodySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}