import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String name;
  final String image;
  final bool checked;
  final VoidCallback toggleChecked;

  CityCard({
    required this.name,
    required this.image,
    this.checked = false,
    required this.toggleChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 30),
      elevation: 10,
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(
                image,
              ),
              child: InkWell(onTap: toggleChecked),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: [
                        Icon(checked ? Icons.star : Icons.star_border,
                            size: 40, color: Colors.white),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        height: 200,
      ),
    );
  }
}
