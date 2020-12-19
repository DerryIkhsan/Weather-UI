import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/pages.dart';

void main() {
  // disable auto rotate
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/bg-sun-blur20.png"), context);
    precacheImage(AssetImage("assets/images/bg-rain-blur20.png"), context);
    precacheImage(AssetImage("assets/images/bg-snow-blur20.png"), context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BarlowCondensed',
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var weather = 1; // untuk indexing page cuaca
  var splash  = true; // untuk page splash screen

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), (){
      setState(() {
        splash = false;
      });
    });

    Timer.periodic(Duration(seconds: 15), (timer) {
      _weather();
      setState(() {});
    });
  }

  // untuk merubah cuaca
  void _weather() {
    weather++;
    if (weather > 3) {
      weather = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    (splash) 
      ? Splash() 
      : (weather == 1)
          ? Sunny()
          : (weather == 2)
            ? Rainy()
            : Snowy(),
        );
  }
}
