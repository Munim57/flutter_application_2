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
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/spider.jpg'),
                  ),
                  title: Text('Jams'),
                  subtitle: Text('Good Mornig...!'),
                  trailing: Text('7:10 AM'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
