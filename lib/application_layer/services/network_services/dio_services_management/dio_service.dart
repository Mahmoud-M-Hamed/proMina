import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://technichal.prominaagency.com/api/",
        receiveDataWhenStatusError: true,
        followRedirects: true,
      ),
    );
  }

  static Future<Response> getData({
    required String? url,
    Map<String, dynamic>? query,
    dynamic token,
  }) async {
    dio?.options.headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };
    return await dio!.get(url!, queryParameters: query);
  }

  static Future<Response> postData({
    required String? url,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio?.options.headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };
    return await dio!.post(
      url!,
      data: data,
    );
  }

  static Future<Response> postImage({
    required String? url,
    required FormData data,
    String? token,
  }) async {
    dio?.options.headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };
    return await dio!.post(
      url!,
      data: data,
    );
  }
}
