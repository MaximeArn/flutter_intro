import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
            image: NetworkImage(
                "https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter"))
        //     Text.rich(
        //   TextSpan(children: [
        //     TextSpan(text: "Coo"),
        //     TextSpan(
        //       text: "K",
        //       style: TextStyle(
        //         color: Color.fromRGBO(255, 215, 0, 1),
        //       ),
        //     ),
        //     TextSpan(text: "ing")
        //   ]),
        //   textDirection: TextDirection.ltr,
        //   style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
        // )
        );
  }
}
