import 'package:flutter/material.dart';

import '../shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(),
      body: const Center(
        child: FlutterLogo(),
      ),
    );
  }
}
