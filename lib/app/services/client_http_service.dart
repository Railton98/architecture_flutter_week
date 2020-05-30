import 'package:architecture_flutter_week/app/interfaces/client_http_interface.dart';
import 'package:dio/dio.dart';

class ClientHttpService implements ClientHttpInterface {
  final Dio dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    final response = await dio.get(url);

    return response.data;
  }
}
