import 'package:flutter/material.dart';

import 'core/interfaces/local_storage_interface.dart';
import 'core/services/shared_local_storage_service.dart';
import 'core/viewmodels/change_theme_viewmodel.dart';

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
