import 'package:architecture_flutter_week/app/modules/home/models/apiadvisor_model.dart';
import 'package:architecture_flutter_week/app/modules/home/repositories/apiadvisor_interface.dart';
import 'package:flutter/foundation.dart';

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
