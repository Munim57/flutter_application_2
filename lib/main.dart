import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter_Demo/home_screen.dart';
import 'package:flutter_application_1/UI/LotteryApp.dart';

import 'package:flutter_application_1/UI/Widgets.dart';
import 'package:flutter_application_1/UI/praxtice.dart';
import 'package:flutter_application_1/UI/pressbutton.dart';

void main() {
  runApp(start());
}

// ignore: camel_case_types
class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
