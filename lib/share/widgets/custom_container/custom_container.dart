// import 'package:flutter/material.dart';
//
//
// class CustomContainer extends StatelessWidget {
//   final Widget child; // Required
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final double? radius;
//   final double? width;
//   final double? height;
//   final EdgeInsetsGeometry? padding; // <-- updated
//   final EdgeInsetsGeometry? margin;
//
//   const CustomContainer({
//     super.key,
//     required this.child,
//     this.backgroundColor,
//     this.borderColor,
//     this.radius,
//     this.width,
//     this.height,
//     this.padding,
//     this.margin,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding ?? const EdgeInsets.all(8), // default 8
//       width: width,
//       height: height,
//       margin: margin,
//       decoration: BoxDecoration(
//         color: backgroundColor ?? Colors.white,
//         borderRadius: BorderRadius.circular(radius ?? 8),
//         border: Border.all(
//           color: borderColor ?? Colors.transparent,
//         ),
//       ),
//       child: child,
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//

import 'package:flutter/material.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';

class CustomContainer extends StatelessWidget {
  final Widget child; // Required
  final Color? backgroundColor;
  final Color? borderColor;
  final bool allSides;
  final double? radius;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final double? vertical;
  final double? horizontal;
  final double? boarderWidth;
  final EdgeInsetsGeometry? padding;

  const CustomContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.allSides = true,
    this.radius,
    this.width,
    this.height,

    this.margin,
    this.vertical,
    this.horizontal,
    this.borderRadius,
    this.boarderWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: horizontal ?? ResponsiveHelper.padding(8),
            vertical: vertical ?? ResponsiveHelper.padding(8),
          ),
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius:
            borderRadius ??
            BorderRadius.circular(radius ?? ResponsiveHelper.borderRadius(8)),
        border:
            allSides
                ? Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: boarderWidth ?? 1,
                )
                : Border(
                  bottom: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: boarderWidth ?? 1,
                  ),
                ),
      ),
      child: child,
    );
  }
}
