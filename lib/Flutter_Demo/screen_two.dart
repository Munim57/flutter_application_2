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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(child: Text('Screen Two', style: TextStyle(fontSize: 50))),
          // Center(
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, ScreenThree.id);
          //     },
          //     child: Text('Screen 2'),
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Munim'),
            subtitle: Text('Miss Call'),
            trailing: Text('9:50 PM'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Munim'),
            subtitle: Text('Miss Call'),
            trailing: Text('9:45 PM'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Hamza'),
            subtitle: Text('Miss Call'),
            trailing: Text('9:40 PM'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Munim'),
            subtitle: Text('Miss Call'),
            trailing: Text('9:39 PM'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Munim'),
            subtitle: Text('Miss Call'),
            trailing: Text('9:30 PM'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Munim'),
            subtitle: Text('Miss Call'),
            trailing: Text('9:50 PM'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Muteeb'),
            subtitle: Text('Miss Call'),
            trailing: Text('9:20 PM'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Umair'),
            subtitle: Text('Miss Call'),
            trailing: Text('8:58 PM'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined),
            title: Text('Ali'),
            subtitle: Text('Miss Call'),
            trailing: Text('8:50 PM'),
          ),
        ],
      ),
    );
  }
}
