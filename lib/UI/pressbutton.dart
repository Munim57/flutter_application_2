import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: Text('My Button Press App')),
        ),
        body: Center(child: Text(x.toString(), style: TextStyle(fontSize: 50))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x++;
            setState(() {});
            print(x.toString());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
