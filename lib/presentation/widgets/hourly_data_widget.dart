import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/core/colors.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';

// ignore: must_be_immutable
class HourlyDataWidget extends StatelessWidget {
  HourlyDataWidget({super.key, required this.weatherDataHourly});
  final WeatherDataHourly weatherDataHourly;

  RxInt cardindex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 20
            ? 20
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx((() => GestureDetector(
              onTap: () {
                cardindex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: CustomColors.dividerLine.withAlpha(150),
                    )
                  ],
                  gradient: cardindex.value == index
                      ? const LinearGradient(
                          colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ],
                        )
                      : null,
                ),
                child: HourlyDetails(
                  cardIndex: cardindex.value,
                  index: index,
                  date: weatherDataHourly.hourly[index].dt!,
                  temp: weatherDataHourly.hourly[index].temp!,
                  weatherIcon:
                      weatherDataHourly.hourly[index].weather![0].icon!,
                ),
              ))));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  const HourlyDetails(
      {super.key,
      required this.temp,
      required this.date,
      required this.weatherIcon,
      required this.index,
      required this.cardIndex});
  final int index;
  final int cardIndex;
  final int temp;
  final int date;
  final String weatherIcon;
  String getTime(final date) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    final x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(date),
            style: TextStyle(
              color: cardIndex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 40,
          width: 40,
          child: Image.asset('assets/weather/$weatherIcon.png'),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            '$temp',
            style: TextStyle(
              color: cardIndex == index ? Colors.white : Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
