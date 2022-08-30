import 'package:exercicio_semana08/src/feature/home/model/user_model.dart';
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
          color: user.status == 'active' ?  const Color(0xFFF2F5FA) : Colors.white30,
          child: InkWell(
            onTap: user.status == 'active'
                ? () => Modular.to.pushNamed('/update/', arguments: user)
                : () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Usuário inativo'),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {
                        },
                      ),
                    )),
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
                    user.gender == 'female' ? Icons.woman : Icons.man,
                    size: 60,
                    color:
                        user.gender == 'female' ? Colors.purple : Colors.green,
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
