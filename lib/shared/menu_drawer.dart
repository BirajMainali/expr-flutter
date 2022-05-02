import 'package:flutter/material.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';

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
      'BMI Calculator',
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
    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(
        ListTile(
            title: Text(element, style: const TextStyle(fontSize: 20)),
            onTap: () {
              switch (element) {
                case 'Home':
                  screen = const IntroScreen();
                  break;
                case 'BMI Calculator':
                  screen = const BMIScreen();
                  break;
              }
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => screen));
            }),
      );
    }
    return menuItems;
  }
}
