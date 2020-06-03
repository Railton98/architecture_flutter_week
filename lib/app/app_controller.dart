import 'package:architecture_flutter_week/app/services/shared_local_storage_service.dart';
import 'package:architecture_flutter_week/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

import 'interfaces/local_storage_interface.dart';

class AppController {
  // ChangeThemeViewModel(storage: SharedLocalStorageService());

  final ChangeThemeViewModel changeThemeViewModel;

  AppController(this.changeThemeViewModel) {
    changeThemeViewModel.init();
  }

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => changeThemeViewModel.config.themeSwitch;

  final LocalStorageInterface storage = SharedLocalStorageService();
}
