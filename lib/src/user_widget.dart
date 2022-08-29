import 'package:exercicio_semana08/src/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          color: Colors.grey,
          child: InkWell(
            onTap: () =>
                Modular.to.pushNamed('/create/update/', arguments: user),
            onLongPress: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Apagar usuário'),
                content: const Text('Tem certeza que deseja apagar?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Modular.to.pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => () {},
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name!),
                    Text(user.email!),
                    Text(user.gender!),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
