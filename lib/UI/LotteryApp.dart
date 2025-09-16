import 'package:flutter/material.dart';

class LotteryApp extends StatefulWidget {
  const LotteryApp({super.key});

  @override
  State<LotteryApp> createState() => _LotteryAppState();
}

class _LotteryAppState extends State<LotteryApp> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('Lottery App', style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('Lottery winnug number is')),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 250,

                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 50, color: Colors.red),
                    SizedBox(height: 10),
                    Text('Better luck next time your number try again'),
                  ],
                ),
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Tap');
          },
          child: Icon(Icons.refresh),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
