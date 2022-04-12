import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:y_perz/common/app_theme.dart';

extension Utilityy on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (
        FocusScope.of(this).focusedChild!.context!.widget is! EditableText);
  }
}

extension Utility on String {
  toast() => Fluttertoast.showToast(
        msg: this,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: AppTheme.primaryGreen,
        timeInSecForIosWeb: 1,
      );
}

extension ContextExntesion on BuildContext {
  hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension Field on TextEditingController {
  String value() => text.toString();
}

extension TextFieldController on TextEditingController {
  getValue() => text.toString();
}

pop() {
  Get.back();
}

extension CustomWidget on Widget {
  containerDecoration(
      {EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      Color backgroundColor = Colors.white,
      double radius = 8,
      double width = 1,
      Color? borderColor = const Color(0xff0B70AD)}) {
    return Container(
        child: this,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(width: width, color: borderColor!),
        ));
  }

  dialog() {
    return Dialog(
      elevation: 0.0,
      insetPadding: 0.paddingAll(),
      backgroundColor: Colors.transparent,
      child: this,
    );
  }

  onTap(Function onTap) {
    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap(),
        child: this,
      ),
    );
  }

  pressBack() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: this,
    );
  }

  navigate(
      {bool isAwait = false,
      bool isRemove = false,
      bool leftToRight = false,
      bool isInfinity = false}) async {
    if (isRemove) {
      return await Get.off(this, transition: Transition.rightToLeftWithFade);
    } else if (isAwait) {
      return await Get.to(this, transition: Transition.rightToLeftWithFade);
    } else if (isInfinity) {
      return await Get.offAll(this, transition: Transition.rightToLeftWithFade);
    } else {
      return await Get.to(this, transition: Transition.rightToLeftWithFade);
    }
  }
}

extension Integer on int {
  delay(Function function) {
    Future.delayed(Duration(seconds: this), () {
      function();
    });
  }

  horizontalSpace() => SizedBox(
        width: toDouble(),
      );

  verticalSpace() => SizedBox(height: toDouble());

  toast(context) => Fluttertoast.showToast(
        msg: toString(),
        backgroundColor: AppTheme.primaryGreen,
        toastLength: Toast.LENGTH_SHORT,
      );

  loop(Function function) {
    for (var i = 0; i < this; i++) {
      function(i);
    }
  }

  paddingLeft() {
    return EdgeInsets.only(left: toDouble());
  }

  paddingTop() {
    return EdgeInsets.only(top: toDouble());
  }

  paddingAll() {
    return EdgeInsets.all(toDouble());
  }

  paddingRight() {
    return EdgeInsets.only(right: toDouble());
  }

  paddingHorizontal() {
    return EdgeInsets.only(left: toDouble(), right: toDouble());
  }

  paddingVertical() {
    return EdgeInsets.only(top: toDouble(), bottom: toDouble());
  }

  marginAll() {
    return EdgeInsets.all(toDouble());
  }

  marginLeft() {
    return EdgeInsets.only(left: toDouble());
  }

  marginTop() {
    return EdgeInsets.only(top: toDouble());
  }

  marginRight() {
    return EdgeInsets.only(right: toDouble());
  }

  marginHorizontal() {
    return EdgeInsets.only(top: toDouble(), bottom: toDouble());
  }

  marginVertical() {
    return EdgeInsets.only(left: toDouble(), right: toDouble());
  }

  paddingOnly({
    required double top,
    required double bottom,
  }) {
    return EdgeInsets.only(
        right: toDouble(), left: toDouble(), top: top, bottom: bottom);
  }

  marginOnly({
    required double top,
    required double bottom,
  }) {
    return EdgeInsets.only(
        right: toDouble(), left: toDouble(), top: top, bottom: bottom);
  }
}
