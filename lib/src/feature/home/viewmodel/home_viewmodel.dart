import 'dart:async';
import 'package:exercicio_semana08/src/feature/home/datasource/home_datasource.dart';
import 'package:exercicio_semana08/src/feature/home/model/user_model.dart';

class HomeViewModel {
  final HomeDatasource datasource;

  final StreamController<List<UserModel>> _stream =
      StreamController<List<UserModel>>();

  Stream<List<UserModel>> get stream => _stream.stream;

  Sink<List<UserModel>> get sink => _stream.sink;

  HomeViewModel(this.datasource) {
    getUsers();
  }

  Future<void> getUsers() async {
    var users = await datasource.getUsers();
    sink.add(users);
  }

  Future<void> deleteUser(int id) async {
    await datasource.deleteUser(id);
    sink.add(await datasource.getUsers());
  }

  Future<dynamic> postUsers(UserModel user) async {
    await datasource.postUsers(user);
    sink.add(await datasource.getUsers());
  }

  Future<void> updateUser(UserModel user) async {
    await datasource.putUser(user);
    sink.add(await datasource.getUsers());
  }
}
