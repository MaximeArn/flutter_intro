import 'package:flutter/material.dart';
import 'package:widgets_tests/views/home_view/home.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.5)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Center(
              child: Text(
                "TravelApp",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("home"),
            onTap: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text("my trips"),
          ),
        ],
      ),
    );
  }
}
