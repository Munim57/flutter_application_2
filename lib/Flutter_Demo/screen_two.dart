import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter_Demo/Screen_three.dart';

class ScreenTwo extends StatefulWidget {
  static const String id = 'ScreenTwo';
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff764abc),
        title: Center(child: Text('Navigation Drawer')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Screen Two', style: TextStyle(fontSize: 50))),
          // Center(
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, ScreenThree.id);
          //     },
          //     child: Text('Screen 2'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
