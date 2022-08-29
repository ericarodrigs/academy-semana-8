import 'package:exercicio_semana08/src/user_model.dart';
import 'package:exercicio_semana08/src/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> listUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: ListView.builder(itemCount: listUsers.length,itemBuilder: (context, index) {
        return UserWidget(
          user: listUsers[index],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Modular.to.pushNamed('/create/');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
