import 'package:flutter/material.dart';
import 'package:kyu_q/pages/loading.dart';
import 'package:kyu_q/pages/home_page.dart';
import 'package:kyu_q/pages/orders_page.dart';
import 'package:kyu_q/pages/settings_page.dart';
import 'package:kyu_q/pages/statistics_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home_page': (context) => const Home(),
      '/orders_page': (context) => const OrderPage(),
      '/settings_page': (context) => SettingsPage(),
      '/statistics_page': (context) => StatisticsPage(),
    },
  ));
}