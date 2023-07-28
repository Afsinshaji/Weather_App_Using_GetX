import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/models/weather_data_daily.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';

class  WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;
  WeatherData([this.daily, this.current, this.hourly]);
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
}
