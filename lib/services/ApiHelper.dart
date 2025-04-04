// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:shopease/services/ApiServices.dart';
//
// final apiservices = ApiServices(baseUrl: "",dio);
// final dio = getDio();
//
// Dio getDio() {
//   BaseOptions options = BaseOptions(
//       receiveDataWhenStatusError: true,
//       contentType: "application/json",
//       sendTimeout: const Duration(seconds: 30),
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30));
//
//   Dio dio = Dio(options);
//
//   dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (request, handler) {
//         debugPrint("API Request BODY: ${request.data}");
//         return handler.next(request);
//       }, onResponse: (response, handler) {
//     debugPrint("API Response: ${response.data}");
//     return handler.next(response);
//   }, onError: (DioException e, handler) {
//     final response = e.response;
//     debugPrint("API Error --> status code: ${response?.statusCode} --> ${response?.statusMessage}: Error");
//     return handler.next(e);
//   }));
//   return dio;
// }
