import 'dart:convert';
import 'package:weatherapp/model/weather_model.dart';

import 'package:http/http.dart' as http;

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=6.1944&lon=106.8229&appid=030d50fa921eba2c6e80404178af70b9"),
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
