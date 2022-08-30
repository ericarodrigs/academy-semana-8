import 'package:exercicio_semana08/src/feature/home/view/update_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UpdateUserPageModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) => UpdateUserPage(user: args.data,)),
  ];
}
