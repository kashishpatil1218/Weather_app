import 'package:flutter/material.dart';

import '../../modal/wether_modal.dart';

Container Fore_cast_Countainer(HourModal hour) {
  return Container(
      height: 130,
      width: 80,
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.start,
        children: [
          Text(
            '${hour.time.split(" ").sublist(1, 2).join(" ")}',
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 18),
          ),
          Image.network(
              'https:${hour.hourConditionModal.icon}'),
          Text(
            '${hour.temp_c}',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18),
          ),
        ],
      ));
}
Column ForeCastText(WeatherModal weather) {
  return Column(
    children: [
      Padding(
        padding:
        const EdgeInsets.only(top: 10, left: 10),
        child: Row(
          children: [
            Icon(
              Icons.watch_later,
              size: 20,
              color: Colors.white70,
            ),
            Text(
              ' 24 - Hour Forecast',
              style: TextStyle(
                  color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
                weather.forcatModal.forcastday.first
                    .hour.length, (index) {
              final hour = weather.forcatModal
                  .forcastday.first.hour[index];
              return Fore_cast_Countainer(hour);
            })
          ],
        ),
      )
    ],
  );
}