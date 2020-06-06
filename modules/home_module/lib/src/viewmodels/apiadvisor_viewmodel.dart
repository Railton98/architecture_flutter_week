import 'package:flutter/foundation.dart';
import 'package:home_module/src/models/apiadvisor_model.dart';
import 'package:home_module/src/repositories/apiadvisor_interface.dart';

class ApiadvisorViewModel {
  final ApiAdvisorInterface repository;

  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel>(null);

  ApiadvisorViewModel(this.repository);

  Future<void> fill() async {
    try {
      apiAdvisorModel.value = await repository.getTime();
    } catch (e) {}
  }
}
