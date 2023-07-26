import 'dart:async';

import 'package:counterapp_flavors/app_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  return MyApp(appConfig);
}

class MyApp extends StatelessWidget {
  final AppConfig appConfig;

  const MyApp(this.appConfig);

  Widget _flavorBanner(Widget child) {
    return Banner(
      child: child,
      location: BannerLocation.topEnd,
      message: appConfig.flavor,
      color: appConfig.flavor == 'dev'
          ? Colors.red.withOpacity(0.6)
          : Colors.green.withOpacity(0.6),
      textStyle: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 14.0, letterSpacing: 1.0),
      textDirection: TextDirection.ltr,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appConfig.flavor == 'dev' ? Colors.yellow : Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _flavorBanner(
        MyHomePage(),
      ),
    );
    return materialApp;
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times.\n'
              'This includes all devices, ever.',
            ),
            Text(
              'Error:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
