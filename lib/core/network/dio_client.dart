import 'package:dio/dio.dart';

abstract class NetworkClient {
  Future<Map<String, dynamic>> get(
      {required String path, Map<String, dynamic>? queryParams});

  Future<Map<String, dynamic>> post(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParams});

  Future<Map<String, dynamic>> patch(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParams});

  Future<Map<String, dynamic>> delete(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParams});
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
  Future<Map<String, dynamic>> delete(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParams}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> get(
      {required String path, Map<String, dynamic>? queryParams}) async {
    try {
      var res = await _dio.get(path);
      return res.data;
    } catch (e) {
      return {'error': e};
    }
  }

  @override
  Future<Map<String, dynamic>> patch(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParams}) async {
    try {
      var res =
          await _dio.patch(path, data: body, queryParameters: queryParams);
      return res.data;
    } catch (e) {
      return {'error': e};
    }
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParams}) async {
    try {
      var res = await _dio.post(path, data: body, queryParameters: queryParams);
      return res.data;
    } catch (e) {
      return {'error': e};
    }
  }
}
