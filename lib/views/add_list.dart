import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/wether_provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherTrue = Provider.of<WeatherProvider>(context, listen: true);
    var weatherFalse = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
          title: const Text(
            'You Favourite',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/23dQ-ezgif.com-crop.gif'))),
          child: ListView.builder(
            itemBuilder: (context, index) {
              // final weatherData = weatherTrue.weather[index].split(' ').sublist(0,1).join(' ');
              final name =
                  weatherTrue.weather[index].split('-').sublist(0, 1).join('-');
              final status =
                  weatherTrue.weather[index].split('-').sublist(1, 2).join('-');
              final temp =
                  weatherTrue.weather[index].split('-').sublist(2, 3).join('-');
              final icon =
                  weatherTrue.weather[index].split('-').sublist(3, 4).join('-');

              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.blueGrey.shade100,
                  shape:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      '${name}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    subtitle: Text('${status}',
                        style: const TextStyle(fontSize: 15, color: Colors.black,)),
                    leading: Image.network('https:${icon}'),
                    trailing: Text(
                      '${temp}°c',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              );
            },
            itemCount: weatherFalse.weather.length,
          ),
        ));
  }
}
