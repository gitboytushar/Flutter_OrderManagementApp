import 'package:flutter/material.dart';
import 'package:kyu_q/pages/loading.dart';
import 'package:kyu_q/pages/home_page.dart';
import 'package:kyu_q/pages/orders_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home_page': (context) => Home(),
      '/orders_page': (context) => OrderPage(),
    },
  ));
}