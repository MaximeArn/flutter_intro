import 'package:flutter/material.dart';
import 'package:widgets_tests/models/Activity.type.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(activity.image),),
        title: Text(activity.name),
        subtitle: Text(activity.city),
        trailing: Checkbox(
          value: false,
          tristate: false,
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
