import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

Future<bool> checkInternetConnection() async {
  dynamic result;
  try {
    result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // print('internet status connected');
      return true;
    }}
  on SocketException catch (_) {
    // print('not connected');
    return false;
  }
  return result.isNotEmpty && result[0].rawAddress.isNotEmpty ? true : false;
}

bool checkValidEmail(String email) {
  bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailValid;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Future<String> imgFromCamera() async {
  XFile? image = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 50);
  return image!.path;
}

Future<String> imgFromGallery() async {
  XFile? image = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 50);
  return image!.path;
}

Future<String> pickVideoFromGallery() async {
  XFile? image = await ImagePicker().pickVideo(
    source: ImageSource.gallery,
  );
  return image!.path;
}

Future<String> pickVideoFromCamera() async {
  XFile? image = await ImagePicker().pickVideo(
    source: ImageSource.gallery,
  );
  return image!.path;
}

bool validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,15}$)';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

double getStatusBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

String randomString(int strlen) {
  var alpha =
      "ARBAEROMCBHAKJJNKKWROJOAIIAHRAMNSNDFNWNNWNXBFBWFEWUEWBBEUWEWBFBWBZKAKKNAKNBWWARAHNAKNAN";
  var numeric = "1234567890987654321123451234567890678900987654321";

  Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 1; i < strlen + 1; i++) {
    if (i % 2 == 0) {
      result += alpha[rnd.nextInt(alpha.length)];
    } else {
      result += numeric[rnd.nextInt(numeric.length)];
    }
  }
  return result;
}

// launchProgress({
//   String message = 'Processing..',
// }) {
//   customDialog(
//       isLoader: true,
//       barrierDismissible: false,
//       widget: const Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
//             //   backgroundColor: Color(0xffDBB77C),
//           )));
// }

disposeProgress() {
  Get.back();
}

// void googleSignInMethod(BuildContext context) {
//   String firstName, lastName, email, socialId;
//   signInWithGoogle().then((result) async {
//     var pr = Provider.of<ApplicationModel>(context, listen: false);
//     AuthRepo authRepo = AuthRepo();
//     if (result != null) {
//       User user = result;
//       String fullName = user.displayName.toString();
//       var names = fullName.split(' ');
//       firstName = names[0];
//       lastName = names.length > 1 ? names[1] : " ";
//       email = user.email.toString();
//       socialId = user.uid;
//       print("socialId==" + socialId);
//       authRepo
//           .socialMediaLogin(
//         loginWith: "Google",
//         firstName: firstName,
//         lastName: lastName,
//         emailId: email,
//         socialId: socialId,
//         locale: "en",
//       )
//           .then((value) {
//         if (value.code == 200) {
//           HomeScreen().navigate(isInfinity: true);
//         } else {
//           showDialog(
//             context: context,
//             builder: (BuildContext context1) => AlertDialogBox(
//               title: value.message,
//               description: "",
//               my_context: context,
//             ),
//           );
//         }
//       });
//     }
//   });
// }
//
// updateLocale(Locale locale, BuildContext context) {
//   print(locale.languageCode);
//   Navigator.of(context).pop();
//   saveStringData(locale.languageCode, NameConstant.LOCALE);
//   Get.updateLocale(locale);
// }
//
// saveNonPrimitiveData(dynamic list, String key) async {
//   var box = await Hive.openBox<dynamic>(NameConstant.SAVE_DATA);
//   await box.put(key, json.encode(list));
// }
//
// saveStringData(String value, String key) async {
//   var box = await Hive.openBox<dynamic>(NameConstant.SAVE_DATA);
//   await box.put(key, value);
// }
//
// getStringData(String key) async {
//   var box = await Hive.openBox<dynamic>(NameConstant.SAVE_DATA);
//   var data = await box.get(
//     key,
//   );
//   if (data != null) {
//     var getBox = await box.get(
//       key,
//     );
//     return getBox;
//   } else {
//     return "";
//   }
// }
//
// getNonPrimitiveData(String key) async {
//   var box = await Hive.openBox<dynamic>(NameConstant.SAVE_DATA);
//   var data = await box.get(
//     key,
//   );
//   if (data != null) {
//     var getBox = json.decode(await box.get(
//       key,
//     ));
//     return getBox;
//   } else {
//
//     return null;
//   }
//
// }

// Future<void> getLoginDetails(LoginController loginController, ShopController shopController, ListingController listingController,) async {
//   await loginController.getLoginData();
//   if (loginController.loginResponse.value.code == 200) {
//     var getUserShop = await shopController.getUserShop(
//         auth: loginController.loginResponse.value.userData!.authToken!,
//         locale: "en");
//     if (getUserShop.code != 401) {
//       var getProduct = await listingController.getProduct(
//           auth: loginController.loginResponse.value.userData!.authToken!,
//           locale: "en",
//           id: loginController.shop_id.value);
//
//       print("authToken" + loginController.loginResponse.value.userData!.authToken!);
//       print("userId" + loginController.loginResponse.value.userData!.userId!);
//       print("shop_id" + loginController.shop_id.value);
// /*
// String shopName="";
// String originCountry="";
// String bankLocation="";
// */
//       var shopName = shopController.getUserShopDataModel.value.shopList
//           ?.basicInfo!.shopName ?? "";
//       var originCountry = shopController.getUserShopDataModel.value.shopList
//           ?.domesticShipping!.originCountry!;
//       var bankLocation = shopController.getUserShopDataModel.value.shopList
//           ?.bankDetails!.bankLocation!;
//       shopController.shopNameController.value = shopName;
//
//       if (getUserShop.code != 401) {
//         // else {
//         if (shopName.isEmpty) {
//           ShopStep1().navigate(isInfinity: true);
//         }
//         else if (originCountry!.isEmpty) {
//           ShopStep2().navigate(isInfinity: true);
//         } else if (bankLocation!.isEmpty) {
//           GetPaid().navigate(isInfinity: true);
//         }
//         else {
//           CustomBottomNavigation().navigate(isInfinity: true);
//         }
//       }
//
//       else {
//         LoginScreen().navigate(isInfinity: true);
//       }
//     }
//   }
//   else {
//     LoginScreen().navigate(isInfinity: true);
//   }
// }

// getAllController() async {
//   await Get.put(LoginController());
//   await Get.put(HomeController());
//   await Get.put(ShopController());
//   await Get.put(ListingController());
//   await Get.put(HomeController());
//   await Get.put(GetPaidController());
//   await Get.put(ProfileController());
//
// }