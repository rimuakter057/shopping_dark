import 'package:flutter/material.dart';
import 'package:home_shopping/features/common/auth/presentation/widgets/input_field_widget.dart';

import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/button/gradient_elevated_button.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';

import '../../../../../helper/responsive_helper/responsive_helper.dart' show ResponsiveHelper;


class PaymentSellerScreen extends StatelessWidget {
  PaymentSellerScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Widget gap=SizedBox(height: ResponsiveHelper.height(24));
    return Scaffold(
      appBar: CustomAppBar(title: AppText.payment),
      body: SingleChildScrollView(
        child: Padding(
          padding:ResponsiveHelper.all(16),
          child: Column(
            children: [
              ///login image
              CustomImage(
                imageSrc: AppAssets.paymentCardImage,
                height:ResponsiveHelper.height(220),
                width: double.infinity
              ),
              gap,
              gap,
              ///name field
              InputFieldWidget(
                title: AppText.cardHolderName,
                hint: "name",
                controller: name,
              ),
              gap,
              ///number field
              InputFieldWidget(
                title: AppText.cardHolderName,
                hint: "00000000000000",
                controller: cardNumber,
              ),
              gap,
              ///expireDate field
              Row(
                children: [
                  Expanded(
                    child: InputFieldWidget(
                      title: AppText.expireDate,
                      hint: "05/01/2026",
                      controller: cardNumber,
                    ),
                  ),
                  SizedBox(width: ResponsiveHelper.width(16)),
                  Expanded(
                    child: InputFieldWidget(
                      title: AppText.cvv,
                      hint: "00000000000000",
                      controller: cardNumber,
                    ),
                  ),
                ],
              ),


              gap,
              gap,
              gap,
              GradientElevatedButton(title: AppText.pay, onPressed: () {}),

            ],
          ),
        ),
      ),
    );

  }
}
