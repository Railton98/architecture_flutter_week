import 'package:flutter/material.dart';

import 'models/app_config_model.dart';

class AppController {
  static final AppController instance = AppController._();

  AppController._();

  final AppConfigModel config = AppConfigModel();

  bool get isDark => config.themeSwitch.value;

  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value) => config.themeSwitch.value = value;
}
