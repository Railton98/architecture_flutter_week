import 'package:architecture_flutter_week/app/modules/home/models/apiadvisor_model.dart';

abstract class ApiAdvisorInterface {
  Future<ApiAdvisorModel> getTime();
}
