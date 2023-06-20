import 'package:dio/dio.dart';

abstract class INetworkService {
  Future<Response<R?>> get<R>(String path,
      Map<String, dynamic>? queryParameters, dynamic data, Options? options);
  Future<Response<R?>> post<R>(String path,
      Map<String, dynamic>? queryParameters, dynamic data, Options? options);
  Future<Response<R?>> put<R>(String path,
      Map<String, dynamic>? queryParameters, dynamic data, Options? options);
  Future<Response<R?>> delete<R>(String path,
      Map<String, dynamic>? queryParameters, dynamic data, Options? options);
}
