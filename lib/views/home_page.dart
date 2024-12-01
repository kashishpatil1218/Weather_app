import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/wether_modal.dart';
import '../provider/wether_provider.dart';
import 'component/Bottom_area.dart';
import 'component/Fore_cast_Countainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherTrue = Provider.of<WeatherProvider>(context, listen: true);
    var weatherFalse = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<WeatherProvider>(context, listen: false).fromMap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModal? weather = snapshot.data;
            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: (weather!.currentModal.is_day == 1)
                            ? AssetImage('assets/img/23dQ-ezgif.com-crop (1).gif')
                            : AssetImage('assets/img/day_img.gif')),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 15.0, top: 40),
                              child: Icon(
                                Icons.menu,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Text(
                                '${weather!.locationModal.name}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15.0, top: 40),
                              child: InkWell(
                                onTap: () {
                                  weatherFalse.addToFavourite(
                                      weather.locationModal.name,
                                      weather.currentModal.condition.text,
                                      weather.currentModal.temp_c.toString(),
                                      weatherFalse.weatherModal!.currentModal
                                          .condition.icon);
                                  Navigator.of(context).pushNamed('/fav');
                                },
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(
                                      color: (weather.currentModal.is_day == 1)
                                          ? Colors.white
                                          : Colors.white),
                                  controller: txtsearch,
                                  onSubmitted: (value) {
                                    weatherFalse.citySearch(value);
                                  },
                                  cursorColor:
                                      (weather.currentModal.is_day == 1)
                                          ? Colors.white
                                          : Colors.white,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search,
                                        color:
                                            (weather.currentModal.is_day == 1)
                                                ? Colors.white
                                                : Colors.white),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                        color:
                                            (weather.currentModal.is_day == 1)
                                                ? Colors.white
                                                : Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              (weather.currentModal.is_day == 1)
                                                  ? Colors.white
                                                  : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${weather.currentModal.temp_c.toString()}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 60),
                                      ),
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: Offset(0, -19),
                                          child: const Text(
                                            'c',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                '${weather.currentModal.condition.text}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: (weather.currentModal.is_day == 1)
                                  ? Color(0xff4E7197).withOpacity(0.8)
                                  : Color(0xff223150).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20)),
                          child: ForeCastText(weather),
                        ),
                        BottomAriea(weather)
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

var txtsearch = TextEditingController();
