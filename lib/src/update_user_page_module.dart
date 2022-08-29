import 'package:exercicio_semana08/src/update_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UpdateUserPageModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) => const UpdateUserPage()),
  ];
}
