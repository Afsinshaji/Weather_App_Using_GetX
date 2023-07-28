import 'dart:convert';

import 'package:weatherapp_starter_project/models/weather_data_current.dart';

import '../core/api_url.dart';
import '../models/weather_data.dart';
import 'package:http/http.dart' as http;

import '../models/weather_data_daily.dart';
import '../models/weather_data_hourly.dart';

class FetchWeatherApi {
  WeatherData? weatherData;
  //processing the data as response to json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataDaily.fromJson(jsonString),
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
    );
    return weatherData!;
  }
}
