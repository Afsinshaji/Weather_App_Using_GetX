import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../controllers/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  String city = '';
  String date = DateFormat('yMMMMd').format(DateTime.now());
  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongtitude().value);
    super.initState();
  }

  getAddress(latitude, longitude) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placeMark[0];
    city = place.locality!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              city,
              style: const TextStyle(fontSize: 35, height: 2),
            )),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              date,
              style:
                  TextStyle(fontSize: 16, height: 1.5, color: Colors.grey[700]),
            )),
      ],
    );
  }
}
