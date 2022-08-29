import 'package:exercicio_semana08/src/user_model.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'nome'),
            onChanged: (String? name) {
              user.name = name;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'email'),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
                isExpanded: true,
                isDense: true,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                ),
                items: <String>['Feminino', 'Masculino', 'Outro']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                }),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
