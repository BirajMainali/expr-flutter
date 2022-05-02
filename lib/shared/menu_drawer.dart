import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calclator',
      'Weather',
      'Training'
    ];

    List<Widget> menuItems = [];
    menuItems.add(
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.cyan),
        child: Text(
          "Globo Fitness",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
    menuTitles.forEach((String element) {
      menuItems.add(
        ListTile(
            title: Text(element, style: TextStyle(fontSize: 20)), onTap: () {}),
      );
    });
    return menuItems;
  }
}
