import 'package:flutter/material.dart';
import 'package:flutter_chapitre13/widgets/main_drawer.dart';

import 'widgets/add_activity_form.dart';

class AddActivityView extends StatelessWidget {
  static const String routeName = "/addTrip";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ajouter un activité"),
      ),
      drawer: MainDrawer(),
      body: AddActivityForm(),
    );
  }
}
