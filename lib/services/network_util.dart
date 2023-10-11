import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:anan_onboarding/helper/config.dart';
import 'package:anan_onboarding/injection.dart';
import 'package:anan_onboarding/routes/route_list.dart';
import 'package:anan_onboarding/services/navigation_service.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'base_service.dart';

class NetworkUtil implements BaseServices {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  http.Client client = http.Client();

  Future<Response> _get(
    String url,
    Map<String, String>? headers,
  ) async {
    log('GET-URL:: $url');
    log('GET-HEADER:: $headers');

    return await client
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .then((Response response) {
      return _handleResponse(response, url);
    });
//     var request = http.MultipartRequest('GET', Uri.parse(url));
//
// //add header fields from requestHeader map
//     request.headers.addAll(headers!);
//     final streamResponse = await request.send();
//     return _handleResponse(await Response.fromStream(streamResponse), url);
  }

  Future<Response> _post(String url,
      {Map<String, String>? headers, body, encoding}) async {
    log('POST-URL:: $url \n BODY: $body \n headers: $headers');
    return await http
        .post(Uri.parse(url), body: body, headers: headers, encoding: encoding)
        .then((Response response) {
      return _handleResponse(response, url);
    });
  }

  Future<Response> _delete(String url, {Map<String, String>? headers}) {
    log('DELETE-URL:: $url  \n Header: $headers');
    return http
        .delete(
      Uri.parse(url),
      headers: headers,
    )
        .then((Response response) {
      return _handleResponse(response, url);
    });
  }

  Future<Response> _put(String url,
      {Map<String, String>? headers, body, encoding}) async {
    log('PUT-URL:: $url  \n BODY: $body');
    return await http
        .put(Uri.parse(url), body: body, headers: headers, encoding: encoding)
        .then((Response response) {
      return _handleResponse(response, url);
    });
  }

  Future<Response> _patch(String url,
      {Map<String, String>? headers, body, encoding}) async {
    log('PATCH-URL:: $url  \n BODY: $body');
    return await http
        .patch(Uri.parse(url), body: body, headers: headers, encoding: encoding)
        .then((Response response) {
      return _handleResponse(response, url);
    });
  }

  Response _handleResponse(Response response, String? url) {
    log('Response ($url):: ${response.body}');
    return response;
  }

  @override
  Future<Response> getDesignStyles() async {
    final Response response = await _get(
      AppApiUrls.getDesignStyles,
      headers,
    );
    return Future.value(response);
  }
}
