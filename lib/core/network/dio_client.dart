import 'package:dio/dio.dart';
import 'package:onboarding_flutter/core/network/network_response.dart';

abstract class NetworkClient {
  Future<NetworkResponse> get({Map<String, dynamic>? queryParams});

  Future<NetworkResponse> post(
      {required Map<String, dynamic> body, Map<String, dynamic>? queryParams});

  Future<NetworkResponse> patch(
      {required Map<String, dynamic> body, Map<String, dynamic>? queryParams});

  Future<NetworkResponse> delete(
      {required Map<String, dynamic> body, Map<String, dynamic>? queryParams});
}

class DioClient implements NetworkClient {
  static DioClient? _client = DioClient._private();
  late Dio _dio;

  DioClient._private() {
    _dio = Dio();
    _dio.options.validateStatus = (code) {
      return (code ?? 0) < 600 ? true : false;
    };
  }

  static DioClient get instance {
    _client ??= DioClient._private();

    return _client!;
  }
  
  @override
  Future<NetworkResponse> delete({required Map<String, dynamic> body, Map<String, dynamic>? queryParams}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future<NetworkResponse> get({Map<String, dynamic>? queryParams}) {
    // TODO: implement get
    throw UnimplementedError();
  }
  
  @override
  Future<NetworkResponse> patch({required Map<String, dynamic> body, Map<String, dynamic>? queryParams}) {
    // TODO: implement patch
    throw UnimplementedError();
  }
  
  @override
  Future<NetworkResponse> post({required Map<String, dynamic> body, Map<String, dynamic>? queryParams}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
