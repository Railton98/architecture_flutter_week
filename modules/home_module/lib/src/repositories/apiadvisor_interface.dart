import 'package:home_module/src/models/apiadvisor_model.dart';

abstract class ApiAdvisorInterface {
  Future<ApiAdvisorModel> getTime();
}
