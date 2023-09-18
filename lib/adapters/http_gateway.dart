// import 'dart:convert';
//
// import 'package:cantina_app/adapters/response_model.dart';
// import 'package:cantina_app/adapters/status_code.dart';
// import 'package:flutter/widgets.dart';
// import 'package:httpGateway/response_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:httpGateway/status_code.dart';
//
// abstract class HttpGateway {
//   static Future<ResponseModel<T>> get<T>(
//       {required String url, required T Function(Object) model}) async {
//     try {
//       Map<String, String> _header = {
//         "Content-Type": "application/json",
//         "Authorization": "",
//       };
//       var response =
//           await http.get(url, headers: _header).timeout(Duration(seconds: 60));
//       if (response.statusCode == StatusCodes.ok) {
//         return ResponseModel<T>(
//           statusCode: StatusCodes.ok,
//           message: "Successfull executed",
//           data: model(json.decode(response.body)),
//         );
//       } else if (response.statusCode == StatusCodes.unAuthorized) {
//         return ResponseModel(
//             statusCode: StatusCodes.unAuthorized,
//             message: "Un authorized user", data: null);
//       } else if (response.statusCode == StatusCodes.notFound) {
//         return ResponseModel(
//             statusCode: StatusCodes.notFound, message: "Not found", data: null);
//       } else {
//         return ResponseModel(
//             statusCode: StatusCodes.serverError,
//             message: "No internet connnection found", data: null);
//       }
//     } catch (e) {
//       return ResponseModel(
//           statusCode: StatusCodes.timeOut,
//           message: "No internet connnection found", data: null);
//     }
//   }
// }
