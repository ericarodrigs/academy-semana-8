import 'dart:async';
import 'package:exercicio_semana08/src/feature/home/datasource/home_datasource.dart';
import 'package:exercicio_semana08/src/feature/home/model/user_model.dart';

class HomeViewModel{
  final HomeDatasource datasource;

  final StreamController<List<UserModel>> _stream = StreamController<List<UserModel>>();

  Stream<List<UserModel>> get stream =>  _stream.stream;
  Sink<List<UserModel>> get sink =>  _stream.sink;

  HomeViewModel(this.datasource){
    getUsers();
  }

  Future<void> getUsers() async{
    var users = await datasource.getUsers();

    sink.add(users);
  }
}
