package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.example.core_module.CoreModulePlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import com.example.login_module.LoginModulePlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    CoreModulePlugin.registerWith(registry.registrarFor("com.example.core_module.CoreModulePlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    LoginModulePlugin.registerWith(registry.registrarFor("com.example.login_module.LoginModulePlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
