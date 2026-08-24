import "package:flutter/material.dart";

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF); //#6564672B

  static const Color primaryText = Color(0xFFF3F3F3);
  static const Color secondaryText = Color(0xFF555555);

  static const Color backgroundColor = Color(0xFF100C1D);


  static const Color brandHoverColor = Color(0xFF001E4D);
  static const Color softBrandColor = Color(0xFFE6ECF5);
  static const Color successColor = Color(0xFF28A745);


  static const Color skyLight = Color(0xFFE0F2FE);
  static const Color skyMedium = Color(0xFF0EA5E9);

  static const Color blueColor = Color(0xff0088FF);



//==============================================================================================================================
  static const Color primaryColor = Color(0xFFCB30E0);
  static const Color titleLargeColor = Color(0xFFF3F3F3);
  static const Color greyTextColor = Color(0xFFD1D1D6);
  static const Color navUnselectedColor = Color(0xFF404040);
  static const Color dividerColor = Color(0xFF656467);
  static const Color inputBorderColor = Color(0x1AFFFFFF);
  static const Color red = Color(0xffFF0000);
  static const Color hintColor = Color(0xff333333);
  static const Color errorColor = Color(0xffFF0000);
  static const Color gradientOne=Color(0xFF6230A0);
  static const Color gradientTwo=Color(0xFFD56CD4);

  // Gradient from #6230A0 to #D56CD4
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      AppColors.gradientOne,
      AppColors.gradientTwo,

    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color tealColor = Color(0xFF007D71);

  static const Color darkGrey = Color(0xFF272728);

  static const Color containerGreyBgColor = Color(0x1AFFFFFF);

  static const Color cartDetailsConColor = Color(0xFF272728);
  static const Color priceTextColor = Color(0xFFCD9235);
  static const Color cartDetailsTextColor = Color(0xFF929394);
  static const Color orangeColor = Color(0xFFFF8D28);
  static const Color productBgColor = Color(0xFF0E0617);
  static const Color searchBarBgColor = Color(0xFF656467);
  static const Color searchTextColor = Color(0xFF8E8E93);
  static const Color subTitleColor = Color(0xFF8E8E93);
  static const Color pendingBgColor = Color(0xFF4F378A);
  static const Color acceptBgColor = Color(0xff34C759);
  static const Color receivedByBgColor = Color(0xFF0088FF);
  static const Color cancelBgColor = Color(0xFFFF383C);
  static const Color completedBgColor = Color(0xFFCB30E0);
  static const Color refundBgColor = Color(0xFFFFCC00);
  static const Color timeNotificationColor = Color(0xFF27C840);
  static const Color completeBgColor = Color(0xFF34C759);
  static const Color drawerBgColor = Color(0xFF101026);

}
