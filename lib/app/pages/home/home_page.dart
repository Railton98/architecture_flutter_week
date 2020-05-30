import 'package:architecture_flutter_week/app/models/apiadvisor_model.dart';
import 'package:architecture_flutter_week/app/repositories/apiadvisor_repository.dart';
import 'package:architecture_flutter_week/app/services/client_http_service.dart';
import 'package:architecture_flutter_week/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';

import 'components/custom_switch_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    ApiadvisorViewModel(
      ApiadvisorRepository(
        ClientHttpService(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.wb_cloudy),
        onPressed: () {
          controller.getTime();
        },
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomSwitchWidget(),
            ValueListenableBuilder<ApiAdvisorModel>(
              valueListenable: controller.time,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: <Widget>[
                    Text(model.date),
                    Text(model.country),
                    Text(model.text),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
