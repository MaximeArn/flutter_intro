import 'package:flutter/material.dart';
import 'package:widgets_tests/widgets/main_drawer.dart';

import 'widgets/add_activity_form.dart';

class AddActivityView extends StatelessWidget {
  static const String routeName = "/addTrip";

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("ajouter un activité"),
      ),
      drawer: MainDrawer(),
      body: AddActivityForm(
        cityName: cityName,
      ),
    );
  }
}
