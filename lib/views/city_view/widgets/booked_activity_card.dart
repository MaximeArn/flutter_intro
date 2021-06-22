import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';

class BookedActivityCard extends StatefulWidget {
  final Activity activity;
  final void Function(Activity) unBookActivity;

  BookedActivityCard(
      {required Key key, required this.activity, required this.unBookActivity})
      : super(key: key);

  @override
  _BookedActivityCardState createState() => _BookedActivityCardState();
}

class _BookedActivityCardState extends State<BookedActivityCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(
          widget.activity.name,
        ),
        subtitle: Text(
          widget.activity.city,
        ),
        trailing: IconButton(
          onPressed: () {
            widget.unBookActivity(widget.activity);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  "activity well deleted",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
