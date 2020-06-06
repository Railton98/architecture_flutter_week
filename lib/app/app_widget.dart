import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:core_module/core_module.dart' show ChangeThemeViewModel;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Modular.get<ChangeThemeViewModel>().config.themeSwitch,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Week | Architecture',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: isDark ? Brightness.dark : Brightness.light,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: isDark ? Colors.black : Colors.white,
            ),
          ),
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
          navigatorKey: Modular.navigatorKey,
        );
      },
    );
  }
}
