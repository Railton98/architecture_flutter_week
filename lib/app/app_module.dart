import 'package:architecture_flutter_week/app/pages/home/home_controller.dart';
import 'package:architecture_flutter_week/app/repositories/apiadvisor_interface.dart';
import 'package:architecture_flutter_week/app/repositories/apiadvisor_repository.dart';
import 'package:architecture_flutter_week/app/services/client_http_service.dart';
import 'package:architecture_flutter_week/app/services/shared_local_storage_service.dart';
import 'package:architecture_flutter_week/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'interfaces/client_http_interface.dart';
import 'interfaces/local_storage_interface.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'viewmodels/apiadvisor_viewmodel.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => ApiadvisorViewModel(i.get())),
        Bind<ApiAdvisorInterface>((i) => ApiadvisorRepository(i.get())),
        Bind<ClientHttpInterface>((i) => ClientHttpService()),
        Bind((i) => AppController(i.get()), lazy: false),
        Bind((i) => ChangeThemeViewModel(storage: i.get())),
        Bind<LocalStorageInterface>((i) => SharedLocalStorageService()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router('/', child: (context, args) => LoginPage()),
        Router('/home', child: (context, args) => HomePage()),
      ];
}
