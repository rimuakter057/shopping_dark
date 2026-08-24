import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/custom_profile_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class HomeAppBarSeller extends StatelessWidget implements PreferredSizeWidget {
  final String profileName;
  final String profileSubtitle;

  final VoidCallback? onNotificationTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onDrawerTap;

  const HomeAppBarSeller({
    super.key,
    required this.profileName,
    required this.profileSubtitle,

    this.onNotificationTap,
    this.onCartTap,
    this.onDrawerTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 1,
      titleSpacing: 0,
      leadingWidth: ResponsiveHelper.width(200),
      leading: Padding(
        padding:  EdgeInsets.only(left:  ResponsiveHelper.padding(12),),
        child: Row(
          children: [
            CustomProfileAvatar(),

             SizedBox(width: ResponsiveHelper.width(8),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileName,
                  style: context.bodyLarge.copyWith(
                      fontFamily: "Poppins"
                  )
                ),
                Text(
                  profileSubtitle,
                  style: context.bodyMedium.copyWith(
                    fontFamily: "Poppins"
                  )
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: onNotificationTap,
          icon: CustomImage(imageSrc: AppAssets.notification)
        ),

        IconButton(
          onPressed: onDrawerTap,
            icon: CustomImage(imageSrc: AppAssets.drawer)
        ),
         SizedBox(width:  ResponsiveHelper.width(8),),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
