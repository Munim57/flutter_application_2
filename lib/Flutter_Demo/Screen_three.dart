import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  static const String id = 'ScreenThree';
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff764abc),
        title: Center(child: Text('Navigater Drawer')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Screen 3'),
            ),
          ),
        ],
      ),
    );
  }
}
