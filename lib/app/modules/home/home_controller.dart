import 'package:flutter/foundation.dart';

import 'models/apiadvisor_model.dart';
import 'viewmodels/apiadvisor_viewmodel.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel> get time => viewModel.apiAdvisorModel;

  getTime() {
    viewModel.fill();
  }
}
