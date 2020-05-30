import 'package:architecture_flutter_week/app/models/apiadvisor_model.dart';
import 'package:architecture_flutter_week/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel> get time => viewModel.apiAdvisorModel;

  getTime() {
    viewModel.fill();
  }
}
