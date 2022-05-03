import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning_flutter/data/weather.dart';

class HttpHelper {
  final String authority = "api.openweathermap.org";
  final String path = "/data/2.5/weather";
  final String appId = "61f221f7655aa99421d5a5bfda562bfb";

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> params = {
      "q": location,
      "appid": appId,
    };
    Uri uri = Uri.https(authority, path, params);
    http.Response response = await http.get(uri);
    Map<String, dynamic> data = json.decode(response.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
