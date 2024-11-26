import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_app/provider/wether_provider.dart';
import 'package:wether_app/views/home_page.dart';
import 'package:wether_app/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => WeatherProvider(),
      builder:(context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=> SplashScreen(),
          '/home':(context)=> HomePage(),
        },
      ),
    );
  }
}
