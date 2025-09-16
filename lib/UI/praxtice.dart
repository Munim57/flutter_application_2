import 'package:flutter/material.dart';

class Fornt extends StatelessWidget {
  const Fornt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              'Munim',
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'Pacifico',
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Abdul Munim',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Pacifico',
                      decoration: TextDecoration.underline,

                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  Icon(Icons.access_time_rounded),
                  Text(
                    'Abdul Munim',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Lato',
                      decoration: TextDecoration.lineThrough,

                      color: Colors.red,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text('Container 1'),
              ),
              SizedBox(height: 15, width: 15),
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                color: Colors.limeAccent,
                child: Text('Container 2'),
              ),
              SizedBox(height: 15, width: 15),
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                color: Colors.teal,
                child: Text('Container 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
