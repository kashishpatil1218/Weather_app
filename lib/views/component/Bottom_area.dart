import 'package:flutter/material.dart';

import '../../modal/wether_modal.dart';

Container BottomAriea(WeatherModal weather) {
  return Container(
    alignment: Alignment.center,
    height: 250,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                height: 90,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (weather.currentModal.is_day == 1)
                      ? Color(0xff4E7197).withOpacity(0.8)
                      : Color(0xff223150).withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${weather.currentModal.wind_mph} mph',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const Divider(
                        color: Colors.grey, indent: 30, endIndent: 30),
                    Text(
                      '${weather.currentModal.wind_kph} kph',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 90,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (weather.currentModal.is_day == 1)
                      ? Color(0xff4E7197).withOpacity(0.8)
                      : Color(0xff223150).withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${weather.forcatModal.forcastday.first.astro.sunrise.split(" ").sublist(0, 1).join(" ")}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          const TextSpan(
                              text: ' sunrise',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      indent: 30,
                      endIndent: 30,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${weather.forcatModal.forcastday.first.astro.sunset.split(" ").sublist(0, 1).join(" ")}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          const TextSpan(
                              text: ' sunset',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 40),
          Container(
            height: 190,
            width: 161,
            decoration: BoxDecoration(
                color: (weather.currentModal.is_day == 1)
                    ? Color(0xff4E7197).withOpacity(0.8)
                    : Color(0xff223150).withOpacity(0.8),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Humidity',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Text('${weather.currentModal.humidity}',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Divider(
                    height: 0.2,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'UV',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Text('${weather.currentModal.uv}',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Divider(
                    height: 0.2,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pressure',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Text('${weather.currentModal.pressure_mb}',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Divider(
                    height: 0.2,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Chance of rain',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Text(
                          '${weather.forcatModal.forcastday.first.day.daily_chance_of_rain}%',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Divider(
                    height: 0.2,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pressure in',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Text('${weather.currentModal.pressure_in}',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
