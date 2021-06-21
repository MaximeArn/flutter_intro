import 'package:flutter/material.dart';
import 'package:widgets_tests/views/home_view/home.dart';
import 'package:widgets_tests/views/trips_view/trips_view.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer();

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
            child: const Center(
              child: Text(
                "TravelApp",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("home"),
            onTap: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
          ),
          Divider(
            height: 10,
            color: Colors.grey.shade600,
          ),
          ListTile(
            leading: const Icon(Icons.flight),
            title: const Text("my trips"),
            onTap: () {
              Navigator.pushNamed(context, TripsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
