import 'package:flutter/material.dart' show Color, Colors;
import 'package:rsc_motorshop/core/app_color.dart'; // Ensure this import exists

class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? imagePath;
  String? productName;
  String? productPrice;

  // Constructor
  RecommendedProduct({
    this.cardBackgroundColor,
    this.buttonTextColor = AppColor.darkOrange, // Default value for button text color
    this.buttonBackgroundColor = Colors.white, // Default button background color
    this.imagePath,
    this.productName,
    this.productPrice,
  });
}
