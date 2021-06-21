import 'package:flutter/material.dart';

class ConfirmationModal extends StatelessWidget {
  final String snackBarMessage;

  ConfirmationModal({required this.snackBarMessage});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(25),
      title: Text(
        "Save this trip ?",
        textAlign: TextAlign.center,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                "No",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(snackBarMessage, textAlign: TextAlign.center,),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text("Yes"),
            ),
          ],
        )
      ],
    );
  }
}
