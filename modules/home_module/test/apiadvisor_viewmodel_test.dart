import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/home_module.dart';
import 'package:home_module/src/models/apiadvisor_model.dart';
import 'package:home_module/src/viewmodels/apiadvisor_viewmodel.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientHttpMockito extends Mock implements ClientHttpInterface {}

class ModuleMock extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ClientHttpInterface>((i) => ClientHttpMockito()),
      ];

  @override
  List<Router> get routers => [];
}

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  initModule(ModuleMock());

  initModule(HomeModule());

  group("ApiadvisorViewModel", () {
    test('ApiadvisorViewModel error', () async {
      when(
        Modular.get<ClientHttpInterface>().get(
            "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=bacf20b53253b3724f5f30608c3159aa"),
      ).thenThrow(
        Exception("error"),
      );

      final viewModel = Modular.get<ApiadvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, null);
    });

    test('ApiadvisorViewModel success', () async {
      when(
        Modular.get<ClientHttpInterface>().get(
            "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=bacf20b53253b3724f5f30608c3159aa"),
      ).thenAnswer(
        (_) => Future.value([
          ApiAdvisorModel(country: "BR", date: "2020/05/30", text: "fdsff").toJson(),
        ]),
      );

      final viewModel = Modular.get<ApiadvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, isA<ApiAdvisorModel>());
    });
  });
}
