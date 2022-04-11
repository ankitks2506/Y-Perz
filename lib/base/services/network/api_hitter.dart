// import 'package:herfat_hamza/base/constant/api_endpoint.dart';
// import 'package:herfat_hamza/base/constant/name_constant.dart';
// import 'package:herfat_hamza/base/controller/get_paid_controller.dart';
// import 'package:herfat_hamza/base/controller/home_controller.dart';
// import 'package:herfat_hamza/base/controller/listing_controller.dart';
// import 'package:herfat_hamza/base/controller/login_controller.dart';
// import 'package:herfat_hamza/base/controller/profile_controller.dart';
// import 'package:herfat_hamza/base/controller/shop_controller.dart';
// import 'package:herfat_hamza/extensions/util_extensions.dart';
// import 'package:herfat_hamza/helper/helper_class.dart';
// import 'package:herfat_hamza/views/auth/login_screen.dart';
// import 'package:hive/hive.dart';
//
// class ApiHitter {
//   static Dio? _dio;
//
//   Dio getDio(  {String baseurl = ''}) {
//     if (_dio == null) {
//       BaseOptions options = new BaseOptions(
//         baseUrl: baseurl.isEmpty ? ApiEndpoint.BASE_URL : baseurl,
//         connectTimeout: 10000,
//         receiveTimeout: 10000,
//       );
//       return new Dio(options)
//         ..interceptors.add(InterceptorsWrapper(
//             onRequest:(options, handler){
//               return handler.next(options); //continue
//             },
//             onResponse:(response,handler) async {
//               debugPrint("response::::" +response.toString());
//               return handler.next(response); // continue
//             },
//             onError: (DioError e, handler) async {
//               // ApiResponse(e.response!.statusCode == 200, response: e.response, msg: e.response!.statusMessage!);
//               debugPrint("error response::::" + e.response.toString());
//               debugPrint("error message::::" + e.message.toString());
//               //      debugPrint("statusCode" + e.response!.statusCode.toString());
//               if(e.response!=null&&e.response!.statusCode==401) {
//                 //  e.response!.statusMessage!.toString().toast();
//                 getx.Get.reset();
//                 await getAllController();
//                 await Hive.box(NameConstant.SAVE_DATA).clear();
//                 await  LoginScreen().navigate(isInfinity:true);
//               }
//               return handler.next(e);
//             }
//         ));
//
//     } else {
//       return _dio!;
//     }
//   }
//
//   Future<ApiResponse> getPostApiResponse(
//       String endPoint,
//       {
//         Map<String, dynamic>? headers,
//         Map<String, dynamic>? data,
//         String baseurl = '',
//       }) async {
//     bool value = await checkInternetConnection();
//     if (value)
//       try {
//         var response = await getDio(
//
//           baseurl: baseurl,
//         ).post(endPoint,
//             options: Options(
//               headers: headers,
//               contentType: "application/json",
//             ),
//             data: data);
//         return ApiResponse(response.statusCode == 200, response: response, msg: response.statusMessage!);
//       } catch (error) {
//         return exception(error,  );
//       }
//     else {
//       return ApiResponse(false, msg: "Check your internet connection and Please try again later.");
//     }
//   }
//
//   Future<ApiResponse> getPutApiResponse(
//       String endPoint,
//       {
//         Map<String, dynamic>? headers,
//         Map<String, dynamic>? data,
//         String baseurl = '',
//       }) async {
//     bool value = await checkInternetConnection();
//     if (value)
//       try {
//         var response = await getDio(
//
//           baseurl: baseurl,
//         ).put(endPoint,
//             options: Options(
//               headers: headers,
//               contentType: "application/json",
//             ),
//             data: data);
//         return ApiResponse(response.statusCode == 200,
//             response: response, msg: response.statusMessage!);
//       } catch (error) {
//         return exception(error,  );
//       }
//     else {
//       return ApiResponse(
//         false,
//         msg: "Check your internet connection and Please try again later.",
//       );
//     }
//   }
//
//   Future<ApiResponse> getApiResponse(
//       String endPoint,
//       {
//         Map<String, dynamic>? headers,
//         Map<String, dynamic>? queryParameters,
//         String baseurl = '',
//       }) async {
//
//     bool value = await checkInternetConnection();
//     if (value) {
//       try {
//         var response = await getDio(
//           baseurl: baseurl,
//         ).get(
//           endPoint,
//           queryParameters: queryParameters,
//           options: Options(
//             headers: headers,
//             contentType: "application/json",
//           ),
//         );
//         return ApiResponse(response.statusCode == 200,
//             response: response,msg: response.statusMessage!);
//       } catch (error) {
//         return exception(error,  );
//       }
//     } else {
//       debugPrint("not connected ");
//
//       return ApiResponse(false, msg: "Check your internet connection and Please try again later.",response: null);
//     }
//   }
//
//   deleteApiResponse(
//       String endPoint,
//       {
//         Map<String, dynamic>? headers,
//         Map<String, dynamic>? data,
//         String baseurl = '',
//       }) async {
//     bool value = await checkInternetConnection();
//     if (value)
//       try {
//         var response = await getDio(
//           baseurl: baseurl,
//         ).delete(
//           endPoint,
//           options: Options(
//             headers: headers,
//             contentType: "application/json",
//           ),
//         );
//         return ApiResponse(response.statusCode == 200,
//             response: response, msg: response.statusMessage!);
//       } catch (error) {
//         return exception(error,  );
//       }
//     else {
//       return ApiResponse(false,msg: "Check your internet connection and Please try again later.");
//     }
//   }
//
//
//   Future<ApiResponse> getFormApiResponse(
//       String endPoint,
//       {FormData? data,
//         Map<String, dynamic>? headers,
//         Map<String, dynamic>? queryParameters}) async {
//     try {
//       var response = await getDio(
//       ).post(endPoint,
//           data: data,
//           queryParameters: queryParameters,
//           options: Options(
//               headers: headers, contentType: 'multipart/form-data'
//           ));
//       return ApiResponse(response.statusCode == 200, response: response, msg: response.statusMessage!);
//     } catch (error) {
//       return exception(error,);
//     }
//   }
//
//   exception(error,  ) {
//     try {
//       return  ApiResponse(error.response!.statusCode == 200, response: error.response, msg: error.response.data["message"]);
//       //return ApiResponse(false, msg: "${error?.response?.data['message'] ?? "Sorry Something went wrong."}",
//       //   );
//     } catch (e) {
//       if (DioErrorType.other == error.type ||
//           DioErrorType.receiveTimeout == error.type ||
//           DioErrorType.connectTimeout == error.type) {
//         if (error.message.contains('SocketException')) {
//           return ApiResponse(false, msg: "Check your internet connection and Please try again later.");
//         }
//         else if(error.message.contains("Connecting timed out [10000ms]")){
//           return ApiResponse(false, msg: "Please check your internet connection",);
//         }
//         else{
//           return ApiResponse(false, msg: "Sorry Something went wrong.",);
//         }
//       } else {
//         return ApiResponse(false, msg: "Sorry Something went wrong.");
//       }
//     }
//   }
// }
//
// class ApiResponse {
//   final bool status;
//   final String msg;
//   final Response ?response;
//
//   ApiResponse(this.status, {this.msg = "Success",  this.response});
// }
