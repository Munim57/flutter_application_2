import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/LotteryApp.dart';

void main() {
  runApp(start());
}

// ignore: camel_case_types
class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LotteryApp());
  }
}
