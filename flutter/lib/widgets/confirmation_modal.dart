import 'package:flutter/material.dart';

class ConfirmationModal extends StatelessWidget {
  final String snackBarMessage;

  ConfirmationModal({required this.snackBarMessage});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(25),
      title: const Text(
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
              child: const Text(
                "No",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      snackBarMessage,
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        )
      ],
    );
  }
}
