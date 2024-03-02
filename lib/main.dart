import 'package:flutter/material.dart';
import 'package:flutter_taxi/config/theme/app_theme.dart';
import 'package:flutter_taxi/screen/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme(),
      title: 'Taxi',
      home: const MyHomePage(),
    );
  }
}


