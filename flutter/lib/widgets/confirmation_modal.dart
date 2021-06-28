import 'package:flutter/material.dart';

class ConfirmationModal extends StatelessWidget {
  const ConfirmationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Voulez vous sauvegarder ?'),
      contentPadding: const EdgeInsets.all(20),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
              child: const Text('annuler'),
              onPressed: () {
                Navigator.pop(context, 'cancel');
              },
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              child: const Text(
                'sauvegarder',
                style: const TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context, 'save');
              },
            ),
          ],
        )
      ],
    );
  }
}
