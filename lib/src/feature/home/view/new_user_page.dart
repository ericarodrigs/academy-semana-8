import 'package:exercicio_semana08/src/feature/home/model/user_model.dart';
import 'package:exercicio_semana08/src/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  String dropdownValue = '';
  final HomeViewModel viewModel = Modular.get<HomeViewModel>();
  UserModel user = UserModel(name: '', email: '', gender: '');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (String name) {
                  user.name = name;
                },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (String email) {
                user.email = email;
              },
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
                  items: <String>['female', 'male']
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
          viewModel.postUsers(user);
          Modular.to.navigate('/');
          viewModel.getUsers();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.save),
      ), //
    );
  }
}
