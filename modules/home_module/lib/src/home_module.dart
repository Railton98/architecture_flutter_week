import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'repositories/apiadvisor_interface.dart';
import 'repositories/apiadvisor_repository.dart';
import 'viewmodels/apiadvisor_viewmodel.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => ApiadvisorViewModel(i.get())),
        Bind<ApiAdvisorInterface>((i) => ApiadvisorRepository(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (context, args) => HomePage()),
      ];
}
