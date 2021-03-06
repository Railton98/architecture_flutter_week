import 'package:architecture_flutter_week/app/interfaces/local_storage_interface.dart';
import 'package:architecture_flutter_week/app/models/app_config_model.dart';

class ChangeThemeViewModel {
  final LocalStorageInterface storage;

  final AppConfigModel config = AppConfigModel();

  ChangeThemeViewModel({this.storage});

  Future init() async {
    await storage.get('isDark').then((value) {
      if (value != null) config.themeSwitch.value = value;
    });
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
