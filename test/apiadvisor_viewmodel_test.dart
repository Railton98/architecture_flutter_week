import 'package:architecture_flutter_week/app/interfaces/client_http_interface.dart';
import 'package:architecture_flutter_week/app/models/apiadvisor_model.dart';
import 'package:architecture_flutter_week/app/repositories/apiadvisor_repository.dart';
import 'package:architecture_flutter_week/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMock implements ClientHttpInterface {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [
      ApiAdvisorModel(country: "BR", date: "2020/05/30", text: "fdsff").toJson(),
    ];
  }
}

class ClientHttpErrorMock implements ClientHttpInterface {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [];
  }
}

class ClientHttpMockito extends Mock implements ClientHttpInterface {}

main() {
  final mock = ClientHttpMockito();

  final viewModel = ApiadvisorViewModel(
    ApiadvisorRepository(
      mock,
    ),
  );

  group("ApiadvisorViewModel", () {
    test('ApiadvisorViewModel error', () async {
      when(
        mock.get(
            "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=bacf20b53253b3724f5f30608c3159aa"),
      ).thenThrow(
        Exception("error"),
      );

      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, null);
    });

    test('ApiadvisorViewModel success', () async {
      when(
        mock.get(
            "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=bacf20b53253b3724f5f30608c3159aa"),
      ).thenAnswer(
        (_) => Future.value([
          ApiAdvisorModel(country: "BR", date: "2020/05/30", text: "fdsff").toJson(),
        ]),
      );

      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, isA<ApiAdvisorModel>());
    });
  });
}
