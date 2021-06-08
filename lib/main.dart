import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //disable horrible banner ^^
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text("Travel"),
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/images/rio.jpeg",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.star_border,
                                        size: 40, color: Colors.white),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Paris",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
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
                )
              ],
            )),
      ),
    );
  }
}
