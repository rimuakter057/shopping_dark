import 'package:flutter/material.dart';
import 'package:home_shopping/utils/color/app_colors.dart';


class GradientElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final LinearGradient? gradient;

  const GradientElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {

    final TextStyle? themeTextStyle =
    Theme.of(context).elevatedButtonTheme.style?.textStyle?.resolve({});

    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient ?? AppColors.buttonGradient,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,

            textStyle: themeTextStyle, // centralized theme text style

          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: themeTextStyle, // theme থেকে style apply
          ),
        ),
      ),
    );
  }
}

