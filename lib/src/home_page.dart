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
  List<UserModel> listUsers = [
    UserModel(id: 1, name: 'EricaEricaEricaEricaEricaEricaErica', email: 'e@e.come@e.come@e.come@e.come@e.come@e.come@e.com', gender: 'Feminino'),
    UserModel(id: 2, name: 'Erica2', email: 'e2@e2.come2@e2.come2@e2.come2@e2.come2@e2.come2@e2.com', gender: 'Feminino'),
    UserModel(id: 3, name: 'Erica3', email: 'e3@e3.com', gender: 'Masculino'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: GridView.builder(
          itemCount: listUsers.length,
          itemBuilder: (context, index) {
            return UserWidget(
              user: listUsers[index],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/create/');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
