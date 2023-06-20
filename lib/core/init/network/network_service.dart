import 'package:cread/core/init/network/i_network.dart';
import 'package:dio/dio.dart';

class NetworkService implements INetworkService {
  NetworkService._init();
  static final NetworkService _instance = NetworkService._init();
  static NetworkService get instance => _instance;

  Dio _dio = Dio();
  @override
  Future<Response<R?>> delete<R>(String path,
      Map<String, dynamic>? queryParameters, data, Options? options) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response<R?>> get<R>(
      String path,
      Map<String, dynamic>? queryParameters,
      dynamic data,
      Options? options) async {
    return _dio.get<R>(path,
        queryParameters: queryParameters, options: options);
  }

  @override
  Future<Response<R?>> post<R>(String path,
      Map<String, dynamic>? queryParameters, data, Options? options) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Response<R?>> put<R>(String path,
      Map<String, dynamic>? queryParameters, data, Options? options) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
