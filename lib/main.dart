import 'package:flutter/material.dart';

import 'package:flutter_application_1/videos_uploading/videos_screen.dart';

void main() {
  runApp(start());
}

// ignore: camel_case_types
class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // initialRoute: HomeScreen.id,

      // routes: {
      //   HomeScreen.id: (context) => HomeScreen(),
      //   ScreenTwo.id: (context) => ScreenTwo(),
      //   ScreenThree.id: (context) => ScreenThree(),
      //   ScreenLast.id: (context) => ScreenLast(),
      // },
      // home: Validationform(),
      // home: squre(),
      // home: HomeScreen(),
      // home: NavigatorBottom(),
      home: VideosScreen(),
    );
  }
}
