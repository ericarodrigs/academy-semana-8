import 'package:exercicio_semana08/src/feature/home/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({Key? key, required user}) : super(key: key);

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  String dropdownValue = '';
  UserModel user = Modular.args.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: user.name,
              decoration: const InputDecoration(labelText: 'Nome'),
              onChanged: (String? name) {
                user.name = name;
              },
            ),
            TextFormField(
              initialValue: user.email,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (String? name) {
                user.email = name;
              },
            ),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                  value: user.gender,
                  isExpanded: true,
                  isDense: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                  ),
                  items: <String>['Feminino', 'Masculino']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? gender) {
                    setState(() {
                      dropdownValue = gender!;
                      user.gender = gender;
                    });
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate('/');
          print('SAIDJHJKASDFHJASDKHJKSDFHLK' +user.toString());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
