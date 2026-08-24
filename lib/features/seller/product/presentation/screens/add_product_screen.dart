import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:home_shopping/features/common/widgets/small_gradient_outline_button_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class AddProductSellerScreen extends StatefulWidget {
  const AddProductSellerScreen({super.key});

  @override
  State<AddProductSellerScreen> createState() => _AddProductSellerScreenState();
}

class _AddProductSellerScreenState extends State<AddProductSellerScreen> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // camera চাইলে ImageSource.camera
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  String? selectedCategory;
  String? selectedBrand;

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(18));
    return Scaffold(
      appBar: AppBar(title: Text(AppText.addProduct)),
      body: SingleChildScrollView(
        padding: ResponsiveHelper.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Dropdown
            _buildLabel(AppText.selectCategory),
            _buildDropdownField(
              value: selectedCategory,
              items: ["Electronics", "Fashion", "Home Decor"],
              onChanged: (val) => setState(() => selectedCategory = val),
            ),
            gap,

            // Brand Dropdown
            _buildLabel(AppText.selectBrand),
            _buildDropdownField(
              value: selectedBrand,
              items: ["Samsung", "Apple", "Sony"],
              onChanged: (val) => setState(() => selectedBrand = val),
            ),
            gap,

            // Product Name
            _buildLabel(AppText.productName),
            _buildInputField(),
            gap,

            // Product Size
            _buildLabel(AppText.productSize),
            _buildInputField(),
            gap,

            // Product Image Placeholder
            _buildLabel(AppText.productImage),
            _buildImagePickerBox(),
            gap,

            // Product Description
            _buildLabel(AppText.productImage),
            _buildInputField(maxLines: 5),

            gap,
            gap,

            // Optional: Submit Button (Add Product)
            SmallOutlineGradientButtonRow(
              outlineTitle: AppText.cancel,
              outlineOnTap: () {},
              gradientTitle: AppText.save,
              gradientOnTap: () {},
            ),

            gap,
          ],
        ),
      ),
    );
  }

  // Label Widget
  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: ResponsiveHelper.padding(8)),
      child: Text(
        label,
        style:  TextStyle(color: Colors.white70, fontSize: ResponsiveHelper.fontSize(14)),
      ),
    );
  }

  // Input Field Widget (Name, Size, Description)
  Widget _buildInputField({int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      style: context.bodyMedium,
      decoration: InputDecoration(
        hintText: AppText.typeHere,
        hintStyle: context.bodyMedium,

        contentPadding: ResponsiveHelper.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
          borderSide: const BorderSide(color: AppColors.inputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
          borderSide: BorderSide(
            color: AppColors.inputBorderColor,
            width: ResponsiveHelper.width(1.5),
          ),
        ),
      ),
    );
  }

  // Dropdown Field Widget
  Widget _buildDropdownField({
    String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: ResponsiveHelper.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
        border: Border.all(color: AppColors.inputBorderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(AppText.select, style: context.bodyMedium),
          dropdownColor: AppColors.darkGrey,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
          isExpanded: true,
          items:
              items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item, style: context.bodyMedium),
                );
              }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildImagePickerBox() {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        width: double.infinity,
        height: ResponsiveHelper.height(150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ResponsiveHelper.borderRadius(10),
          ),
          border: Border.all(color: AppColors.inputBorderColor),
        ),
        child:
            selectedImage != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.borderRadius(10),
                  ),
                  child: Image.file(
                    selectedImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImage(
                      imageSrc: AppAssets.addImage,
                      height: ResponsiveHelper.iconSize(24),
                      width: ResponsiveHelper.iconSize(24),
                    ),
                    SizedBox(height: ResponsiveHelper.height(8)),
                    Text(AppText.image, style: context.bodyMedium),
                  ],
                ),
      ),
    );
  }
}
