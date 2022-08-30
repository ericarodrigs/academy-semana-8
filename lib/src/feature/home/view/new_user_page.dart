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
  final HomeViewModel viewModel = Modular.get<HomeViewModel>();
  UserModel user = UserModel(name: '', email: '', gender: '');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (name) =>
                      name == null || name.isEmpty ? 'Nome obrigatório' : null,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  onChanged: (String name) {
                    user.name = name;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) =>
                      email == null || email.isEmpty || !email.contains('@') ? 'Email obrigatório ou inválido' : null,
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (String email) {
                    user.email = email;
                  },
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                    validator: (gender) =>
                        gender == null ? 'Gênero obrigatório' : null,
                    isExpanded: true,
                    isDense: true,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                    ),
                    items: <String>['female', 'male']
                        .map<DropdownMenuItem<String>>((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(
                          gender == 'female' ? 'Feminino' : 'Masculino',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? gender) {
                      setState(() {
                        user.gender = gender!;
                      });
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            viewModel.postUsers(user);
            Modular.to.navigate('/');
          }
        },
        tooltip: 'Salvar',
        child: const Icon(Icons.save),
      ), //
    );
  }
}
