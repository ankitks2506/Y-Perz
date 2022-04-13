import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:y_perz/common/alert_dialog_box.dart';
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

Widget editTextField(TextEditingController controller, bool isPasVisible,
    String hint, bool _passwordVisible,
    {Function? onPressed,
    int? length,
    int maxLines = 1,
    bool enableNumber = false,
    Widget? suffixWidget,
    ValueChanged<String>? onFieldSubmitted,
    ValueChanged<String>? onChanged,
    bool enabled = true}) {
  return Container(
    margin: 10.marginTop(),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
    ),
    child: TextFormField(
      showCursor: false,
      enabled: enabled,
      controller: controller,
      inputFormatters: [LengthLimitingTextInputFormatter(length)],
      textInputAction: TextInputAction.next,
      textAlignVertical: TextAlignVertical.center,
      obscureText: isPasVisible ? !_passwordVisible : false,
      keyboardType: enableNumber ? TextInputType.number : null,
      maxLines: maxLines,
      onChanged: (value) {
        if (onChanged != null) onChanged(value);
      },
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) onFieldSubmitted(value);
      },
      decoration: InputDecoration(
        contentPadding: 15.paddingOnly(top: 15, bottom: 15),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        suffixIcon: isPasVisible
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  onPressed!();
                },
              )
            : null,
        suffix: suffixWidget,
      ),
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
    ),
  );
}

validationDialog(String title, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context1) => AlertDialogBox(
      title: title,
      description: "",
      myContext: context,
    ),
  );
}
