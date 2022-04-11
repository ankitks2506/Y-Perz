import 'package:flutter/material.dart';
import 'package:y_perz/common/app_theme.dart';
import 'package:y_perz/extensions/util_extensions.dart';
import 'package:y_perz/helper/helper_class.dart';

Widget myButton({
  required BuildContext context,
  String? text,
  dynamic onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: screenWidth(context) * 0.3,
      height: screenHeight(context) * 0.05,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        text.toString(),
        style: const TextStyle(
          color: AppTheme.primaryGreen,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget customTextField(
  TextEditingController controller,
) {
  return TextFormField(
    showCursor: false,
    cursorColor: AppTheme.accentColor,
    controller: controller,
    decoration: InputDecoration(
      contentPadding: 10.paddingAll(),
      fillColor: AppTheme.accentColor,
      hintText: "Password",
      hintStyle: const TextStyle(
        color: Colors.white,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.accentColor,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.accentColor,
        ),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.accentColor,
        ),
      ),
    ),
  );
}
