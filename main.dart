import 'package:api/home.dart';
import 'package:api/second_page.dart';
import 'package:api/serthd_page.dart';
import 'package:flutter/material.dart';

import 'forth_page.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/therd',
        routes: {
          '/': (context) => const Home(),
          '/second': (context) => const second(),
          '/therd': (context) => const therd(),
          '/forth': (context) =>  forth(),
        }),
  );
}
