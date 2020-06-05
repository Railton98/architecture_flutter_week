import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/interfaces/client_http_interface.dart';
import 'core/interfaces/local_storage_interface.dart';
import 'core/services/client_http_service.dart';
import 'core/services/shared_local_storage_service.dart';
import 'core/viewmodels/change_theme_viewmodel.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ClientHttpInterface>((i) => ClientHttpService()),
        Bind((i) => AppController(i.get()), lazy: false),
        Bind((i) => ChangeThemeViewModel(storage: i.get())),
        Bind<LocalStorageInterface>((i) => SharedLocalStorageService()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/home', module: HomeModule()),
      ];
}
