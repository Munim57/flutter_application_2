import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter_Demo_practice/Screen_Last.dart';
import 'package:flutter_application_1/Flutter_Demo_practice/Screen_three.dart';
import 'package:flutter_application_1/Flutter_Demo_practice/home_screen.dart';
import 'package:flutter_application_1/Flutter_Demo_practice/screen_two.dart';
import 'package:flutter_application_1/componets_widgets_in_flutter/components.dart';
import 'package:flutter_application_1/lottery_app/LotteryApp.dart';
import 'package:flutter_application_1/validation_form_flutter/Validation.dart';
import 'package:flutter_application_1/widgets_influtter/Widgets.dart';

import 'package:flutter_application_1/Practice_flutter/praxtice.dart';
import 'package:flutter_application_1/press_button/pressbutton.dart';

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
      initialRoute: HomeScreen.id,

      // routes: {
      //   HomeScreen.id: (context) => HomeScreen(),
      //   ScreenTwo.id: (context) => ScreenTwo(),
      //   ScreenThree.id: (context) => ScreenThree(),
      //   ScreenLast.id: (context) => ScreenLast(),
      // },
      home: Validationform(),
    );
  }
}
