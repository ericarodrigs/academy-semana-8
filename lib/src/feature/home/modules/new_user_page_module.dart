import 'package:exercicio_semana08/src/feature/home/view/new_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewUserPageModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) => const NewUserPage()),
  ];
}
