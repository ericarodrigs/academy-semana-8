import 'package:exercicio_semana08/src/services/api_service.dart';
import 'package:exercicio_semana08/src/feature/home/model/user_model.dart';

class HomeDatasource {
  final ApiService service;

  HomeDatasource(this.service);

  Future<List<UserModel>> getUsers() async {
    try {
      var response = await service.get(route: '/users');

      List<UserModel> users = response.data
          .map<UserModel>((user) => UserModel.fromJson(user))
          .toList();

      return users;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<void> deleteUser(int id) async {
    try {
      await service.delete(
        route: '/users/$id',
      );
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel?> postUsers(UserModel user) async {
    try {
      var response = await service.post(route: '/users', body: user.toJson());
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserModel?> putUser(UserModel user) async {
    try {
      var response =
          await service.put(route: '/users/${user.id}', body: user.toJson());
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
