import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/presentation/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/presentation/widgets/hourly_data_widget.dart';

import '../widgets/daily_data_forcats.dart';
import '../widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ?  Center(
                  child: Image.asset('assets/icons/clouds.png',
                  height: 200,
                  width: 200,),
                )
              : Center(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),
                      CurrentWeatherWidget(
                          weatherDataCurrent:
                              globalController.getData().getCurrentWeather()),
                      const SizedBox(
                        height: 20,
                      ),
                      HourlyDataWidget(
                          weatherDataHourly:
                              globalController.getData().getHourlyWeather()),
                      DailyDataForecast(
                          weatherDataDaily:
                              globalController.getData().getDailyWeather()),
                    ],
                  ),
                ))),
    );
  }
}
