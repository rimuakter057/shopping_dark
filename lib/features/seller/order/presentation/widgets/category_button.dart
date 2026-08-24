import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/utils/color/app_colors.dart';

class CustomCategoryButtons extends StatelessWidget {
  const CustomCategoryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ১. Shoes Button (Full Gradient Fill)
        Container(
          padding: ResponsiveHelper.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(30)),
            gradient: AppColors.buttonGradient,
          ),
          child: Row(
            children: [
              Icon(
                Icons.directions_run,
                color: Colors.white,
                size: ResponsiveHelper.fontSize(20),
              ),
              SizedBox(width: ResponsiveHelper.width(8)),
              Text(
                "Shoes",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: ResponsiveHelper.fontSize(16),
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: ResponsiveHelper.height(15)), // মাঝখানের গ্যাপ
        // ২. Jewelry Button (Gradient Border)
        Container(
          padding: ResponsiveHelper.all(1.5), // বর্ডারের পুরুত্ব বা Thickness
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.borderRadius(30),
            ),
            gradient: LinearGradient(
              colors: [Color(0xFF8E44AD), Color(0xFFD980FA)],
            ),
          ),
          child: Container(
            padding: ResponsiveHelper.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(30)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.diamond_outlined,
                  color: Colors.grey,
                  size: ResponsiveHelper.iconSize(20),
                ),
                SizedBox(width: ResponsiveHelper.width(8)),
                Text(
                  "Jewelry",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveHelper.fontSize(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
