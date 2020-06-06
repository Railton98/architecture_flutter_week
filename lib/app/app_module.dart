import 'package:core_module/core_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_module/home_module.dart';
import 'package:login_module/login_module.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ClientHttpInterface>((i) => ClientHttpService()),
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
