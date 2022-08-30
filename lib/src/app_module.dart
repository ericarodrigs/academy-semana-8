import 'package:exercicio_semana08/src/feature/home/datasource/home_datasource.dart';
import 'package:exercicio_semana08/src/feature/home/modules/home_page_module.dart';
import 'package:exercicio_semana08/src/feature/home/viewmodel/home_viewmodel.dart';
import 'package:exercicio_semana08/src/services/dio_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind(
            (i) => DioService()
    ),
    Bind((i) => HomeDatasource(i.get())),
    Bind((i) => HomeViewModel(i.get()))
  ];


  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomePageModule())
      ];
}
