import 'package:dio/dio.dart';

import 'api_service.dart';

class DioService implements ApiService{
  Dio dio = Dio(BaseOptions(baseUrl: 'https://gorest.co.in/public/v2',));

  @override
  Future get({required String route}) async {
    var response = await dio.get(route);
    return response;
  }

  @override
  Future post({required String route, Map? body }) async {
    var response = await dio.post(route, data: body);
    return response;
  }

  void setToken(String token) {
    dio.options.headers.addAll({"Authorization": "Bearer $token"});
  }

  void setInterceptor() {
     dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler){

      },
      onRequest: (options, handler){
        handler.next(options);
      } ,
      onResponse: (e, handler){

      },
    ));
  }

  @override
  Future put({required String route, Map? body}) async {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future delete({required String route}) async {
    dio.options.headers.addAll({});
    // TODO: implement delete
    throw UnimplementedError();
  }


}