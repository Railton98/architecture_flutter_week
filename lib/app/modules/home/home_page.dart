import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/custom_switch_widget.dart';
import 'home_controller.dart';
import 'models/apiadvisor_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
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
      ),
    );
  }
}
