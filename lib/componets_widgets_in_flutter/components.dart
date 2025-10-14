import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets_widgets_in_flutter/round_button.dart';

class Components extends StatefulWidget {
  const Components({super.key});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Components')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RoundButton(
              name: 'Login',
              onPress: () {
                print('click');
              },
            ),
            RoundButton(
              name: 'Sgin up',
              onPress: () {
                print('click 1');
              },
            ),
            RoundButton(
              name: 'Logout',
              onPress: () {
                print('click 2');
              },
            ),
            RoundButton(
              name: 'Ok',
              onPress: () {
                print('click 3');
              },
            ),
            RoundButton(
              name: 'Done',
              onPress: () {
                print('click 4');
              },
            ),
            RoundButton(
              name: 'Forgot password',
              onPress: () {
                print('click 5');
              },
            ),
            RoundButton(
              name: 'Continue',
              onPress: () {
                print('click 6');
              },
            ),
          ],
        ),
      ),
    );
  }
}
