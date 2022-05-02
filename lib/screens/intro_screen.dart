import 'package:flutter/material.dart';
import 'package:learning_flutter/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Globo App"),
        ),
        drawer: const MenuDrawer(),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/image/gym.jpg'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white70,
              ),
              child: const Text(
                  "Commit to be fit, dare to be great with globo Fitness",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.grey,
                    )
                  ])),
            ),
          ),
        ));
  }
}
