import 'package:flutter/material.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  String dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar'),
      ),
      body:           Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(decoration: InputDecoration(labelText: 'nome'),),
          TextFormField(decoration: InputDecoration(labelText: 'email'),),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
                isExpanded: true,
                isDense: true,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.blue, width: 1.5),
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
      ),
    );
  }
}
