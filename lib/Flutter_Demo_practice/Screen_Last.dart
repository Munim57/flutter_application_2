import 'package:flutter/material.dart';

class ScreenLast extends StatefulWidget {
  static const String id = 'ScreenLast';
  const ScreenLast({super.key});

  @override
  State<ScreenLast> createState() => _ScreenLastState();
}

class _ScreenLastState extends State<ScreenLast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff764abc),
        title: Center(child: Text('Navigation Drawer')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image(
                image: NetworkImage(
                  'https://images.pexels.com/photos/31891237/pexels-photo-31891237.jpeg',
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Image From Pexels',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                image: NetworkImage(
                  'https://images.pexels.com/photos/31353858/pexels-photo-31353858.jpeg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
