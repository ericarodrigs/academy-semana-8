import 'package:dio/dio.dart';
import 'package:exercicio_semana08/api_key.dart';

import 'api_service.dart';

class DioService implements ApiService{
  Dio dio = Dio(BaseOptions(baseUrl: 'https://gorest.co.in/public/v2',));

  void setToken(String token) {
    dio.options.headers.addAll({"Authorization": "Bearer $token"});
  }

  @override
  Future get({required String route}) async {
    setToken(apiKey);
    var response = await dio.get(route);
    return response;
  }

  @override
  Future delete({required String route}) async {
    setToken(apiKey);
    await dio.delete(route);
  }

  @override
  Future post({required String route, Map? body }) async {
    setToken(apiKey);
    var response = await dio.post(route, data: body);
    return response;
  }


  @override
  Future put({required String route, Map? body}) async {
    setToken(apiKey);
    var response = await dio.put(route, data: body);
    return response;
  }


}