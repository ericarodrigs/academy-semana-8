import 'package:exercicio_semana08/src/feature/home/view/home_page.dart';
import 'package:exercicio_semana08/src/feature/home/modules/new_user_page_module.dart';
import 'package:exercicio_semana08/src/feature/home/view/update_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePageModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) => const HomePage()),
    ModuleRoute('/create', module: NewUserPageModule()),
    ChildRoute('/update/', child: (context, args) => UpdateUserPage(user: args.data)),
  ];
}
