import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String _baseUrl = "https://6525210567cfb1e59ce6ae75.mockapi.io/api/v1/"; // Development

  static Uri getUrl(String methodName) {
    if (methodName.contains("http")) {
      return Uri.parse(methodName);
    } else {
      return Uri.parse(_baseUrl + methodName);
    }
  }

  /// GET
  static Future<dynamic> get(String url,
      {Map<String, String>? headerMap}) async {
    dynamic responseJson;
    try {
      http.Response response;
      if (headerMap == null) {
        response = await http.get(getUrl(url));
      } else {
        response = await http.get(
          getUrl(url),
          headers: headerMap,
        );
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
    return responseJson;
  }

  @visibleForTesting
  static dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 204:
        return {};
      case 400:
        throw getMessage(response);
      case 401:
        throw getMessage(response);
      case 403:
        throw getMessage(response);
      case 500:
        throw getMessage(response);
      case 404:
        throw getMessage(response);
      case 406:
        throw getMessage(response);

      default:
        throw 'Error occurred while communication with server'
            ' with status code : ${response.statusCode}';
    }
  }

  static String getMessage(http.Response response) {
    dynamic responseJson = jsonDecode(response.body);
    String? msg = responseJson['message'];
    if (msg != null) {
      return msg;
    } else {
      return "ERROR ${response.statusCode} - NO ERROR MESSAGE RECEIVED FROM BACKEND ";
    }
  }
}
