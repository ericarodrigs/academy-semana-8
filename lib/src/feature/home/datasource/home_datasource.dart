import 'package:dio/dio.dart';
import 'package:exercicio_semana08/src/exceptions/failure.dart';
import 'package:exercicio_semana08/src/services/api_service.dart';
import 'package:exercicio_semana08/src/feature/home/model/user_model.dart';

class HomeDatasource {
  final ApiService service;

  HomeDatasource(this.service);

  Future<dynamic> getUsers() async {
    try {
      var response = await service.get(route: '/users');

      List<UserModel> users = response.data
          .map<UserModel>((user) => UserModel.fromJson(user))
          .toList();

      return users;
    } on DioError catch (e) {
      return Failure(message: e.message, stackTrace: e.stackTrace);
    }
  }

  Future<dynamic> deleteUser(int id) async {
    try {
      await service.delete(
        route: '/users/$id',
      );
    } on DioError catch (e) {
      return Failure(message: e.message, stackTrace: e.stackTrace);
    }
  }

  Future<dynamic> postUsers(UserModel user) async {
    try {
      var response = await service.post(route: '/users', body: user.toJson());
      return response;
    } on DioError catch (e) {
      return Failure(message: e.message, stackTrace: e.stackTrace);
    }
  }

  Future<dynamic> putUser(UserModel user) async {
    try {
      var response =
          await service.put(route: '/users/${user.id}', body: user.toJson());
      return response;
    } on DioError catch (e) {
      return Failure(message: e.message, stackTrace: e.stackTrace);
    }
  }
}
