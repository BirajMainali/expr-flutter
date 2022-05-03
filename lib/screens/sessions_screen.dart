import 'package:flutter/material.dart';
import '../data/SP_helper.dart';
import '../data/session.dart';
import '../shared/menu_drawer.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SpHelper helper = SpHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainig sessions'),
      ),
      drawer: const MenuDrawer(),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter training session'),
            content: SingleChildScrollView(
                child: Column(children: [
              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              TextField(
                controller: txtDuration,
                decoration: const InputDecoration(
                  labelText: 'Duration',
                ),
              )
            ])),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                  txtDescription.text = "";
                  txtDuration.text = "";
                },
              ),
              ElevatedButton(
                child: const Text("Save"),
                onPressed: saveSession,
              )
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter() + 1;
    Session session = Session(
        id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    helper.writeSession(session).then((_) {
      updateScreen();
      helper.setCounter();
    });
    txtDescription.text = "";
    txtDuration.text = "";
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.deleteSession(session.id).then((value) {
            updateScreen();
          });
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date} - duration: ${session.duration} min'),
        ),
      ));
    }
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
