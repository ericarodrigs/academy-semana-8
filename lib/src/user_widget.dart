import 'package:exercicio_semana08/src/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          color: const Color(0xFFF2F5FA),
          child: InkWell(
            onTap: () => Modular.to.pushNamed('/update/', arguments: user),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Icon(
                    user.gender == 'Feminino'
                        ? Icons.woman
                        : Icons.man,
                    size: 80,
                    color: user.gender == 'Feminino' ? Colors.purple : Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    user.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    user.email!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
