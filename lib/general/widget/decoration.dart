import 'package:flutter/material.dart';

import '../../util/app_color.dart';
import '../../util/text_style.dart';

InputDecoration buildInputDecoration(String hint, String? label,{bool isMandatory = false}) {
  return InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      alignLabelWithHint: true,
      label: RichText(text: TextSpan(text: label,style: const TextStyle(color: Colors.black54), children: [TextSpan(text: isMandatory? " *": "", style: const TextStyle(color: Colors.red))]),),
      //labelText: label ?? "",
      hintText: hint,
      hintStyle: AppTextStyles.hintTextStyle,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 0.0),
      ),
      border: const UnderlineInputBorder(),
      filled: true,
      fillColor: Colors.white);
}

InputDecoration buildDropdownButtonDecoration(String hint,{bool isMandate = false}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(15),
    label: RichText(text: TextSpan(text: hint,style: const TextStyle(color: Colors.black54), children: [TextSpan(text: isMandate? " *": "", style: const TextStyle(color: Colors.red))]),),
    // hintText: hint,
    // hintStyle: AppTextStyles.hintTextStyle,
    border: const OutlineInputBorder(),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 0.0),
    ),
  );
}

ButtonStyle buildButtonStyle() {
  return ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.black26))));
}

ButtonStyle buildAltButtonStyle() {
  return ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.black26))));
}

InputDecoration buildPasswordInputDecoration(String hint, String label, bool passwordVisible, Function action) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(15),
    alignLabelWithHint: true,
    hintText: hint,
    // labelText: label,
    label: RichText(text: TextSpan(text: label,style: const TextStyle(color: Colors.black54), children: const [TextSpan(text: " *", style: TextStyle(color: Colors.red))]),),
    hintStyle: AppTextStyles.hintTextStyle,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 0.0),
    ),
    border: const OutlineInputBorder(),
    filled: true,
    fillColor: Colors.white,
    suffixIcon: IconButton(
      icon: Icon(
        passwordVisible ? Icons.visibility : Icons.visibility_off,
        color: Colors.black45,
        size: 20,
      ),
      onPressed: () {
        action();
      },
    ),
  );
}

ButtonStyle buildAddToCartButtonStyle() {
  return ButtonStyle(
      elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return 10.0;
          }
          return 0;
        },
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.black26))));
}