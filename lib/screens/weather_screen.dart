import 'package:flutter/material.dart';
import 'package:learning_flutter/data/weather.dart';

import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather("", "", 0, 0, 0, 0);
  final TextEditingController txtPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                    controller: txtPlace,
                    decoration: InputDecoration(
                        helperText: 'Enter a city name',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: getWeather,
                        )))),
            watherRow('Place', result.name),
            watherRow('Description', result.description),
            watherRow(
                'Templature', result.temprature.toStringAsFixed(2).toString()),
            watherRow(
                'Pereceived', result.pereceived.toStringAsFixed(2).toString()),
            watherRow('Pressure', result.pressure.toString()),
            watherRow('Humidity', result.humidity.toString()),
          ]),
        ));
  }

  Future getWeather() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget watherRow(String label, String value) {
    Widget row = Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ));
    return row;
  }
}
