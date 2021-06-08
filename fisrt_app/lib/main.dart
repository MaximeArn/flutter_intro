import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "homepage",
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Text(
            "hello world",
            style:
                TextStyle(fontSize: 50, color: Color.fromRGBO(250, 215, 0, 1)),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromRGBO(250, 215, 0, 1),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: "star"),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_rate), label: "rewards"),
          ],
        ),
        drawer: Drawer(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    child: Center(child: Text("Menu")),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(250, 215, 0, 1)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, bottom: 30),
              child: Row(
                children: [Icon(Icons.supervised_user_circle), Text("Profile")],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: [Icon(Icons.subway_rounded), Text("subway")],
              ),
            )
          ],
        )),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
