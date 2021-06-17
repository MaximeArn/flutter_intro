import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity.type.dart';

class BookedActivityCard extends StatefulWidget {
  final Activity activity;
  final void Function(String) unBookActivity;

  Color getColor() {
    const List<Color> colors = [Colors.blue, Colors.red];
    return colors[Random().nextInt(2)];
  }

  BookedActivityCard(
      {required Key key, required this.activity, required this.unBookActivity})
      : super(key: key);

  @override
  _BookedActivityCardState createState() => _BookedActivityCardState();
}

class _BookedActivityCardState extends State<BookedActivityCard> {
  late Color color;

  @override
  void initState() {
    color = widget.getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(widget.activity.name),
        subtitle: Text(
          widget.activity.city,
          style: TextStyle(color: color),
        ),
        trailing: IconButton(
          onPressed: () {
            widget.unBookActivity(widget.activity.id);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
