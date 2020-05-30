import 'package:architecture_flutter_week/app/interfaces/client_http_interface.dart';
import 'package:architecture_flutter_week/app/models/apiadvisor_model.dart';
import 'package:architecture_flutter_week/app/repositories/apiadvisor_interface.dart';

class ApiadvisorRepository implements ApiAdvisorInterface {
  final ClientHttpInterface client;

  ApiadvisorRepository(this.client);

  @override
  Future<ApiAdvisorModel> getTime() async {
    final String _url =
        'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=bacf20b53253b3724f5f30608c3159aa';
    final json = await client.get(_url);

    ApiAdvisorModel model = ApiAdvisorModel.fromJson(json[0]);
    return model;
  }
}
