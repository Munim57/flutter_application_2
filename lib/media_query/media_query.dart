import 'package:flutter/material.dart';

void main() {
  runApp(Mediaquery());
}

class Mediaquery extends StatefulWidget {
  const Mediaquery({super.key});

  @override
  State<Mediaquery> createState() => _MediaqueryState();
}

class _MediaqueryState extends State<Mediaquery> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kTextTabBarHeight;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: Text('Media Query')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Height ${height.toString()}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Width ${width.toString()}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
