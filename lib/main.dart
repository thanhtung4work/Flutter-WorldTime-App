import 'package:flutter/material.dart';
import 'package:international_clock/pages/choose_location.dart';
import 'package:international_clock/pages/home.dart';
import 'package:international_clock/pages/loading.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        routes: {
          "/":          (context) => Loading(),
          "/home":      (context) => Home(),
          '/locations': (context) => ChooseLocation()
        },
      )
  );
}


