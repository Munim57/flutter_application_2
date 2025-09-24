import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter_Demo/Screen_three.dart';
import 'package:flutter_application_1/Flutter_Demo/screen_two.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff764abc),
        title: Center(child: Text('Navigation Drawer')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(child: Text('Munim')),
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff764abc)),
              currentAccountPicture:
                  // Image(
                  //   image: NetworkImage(
                  //     'https://images.pexels.com/photos/2613260/pexels-photo-2613260.jpeg',
                  //   ),
                  // ),
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    // backgroundImage: AssetImage('assets/spider.jpg'),
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/2613260/pexels-photo-2613260.jpeg',
                    ),
                  ),
              accountName: Text('Abdul Munim'),
              accountEmail: Text('muxi13@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Page 1'),
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_outlined),
              title: Text('Page 2'),
              onTap: () {
                Navigator.pushNamed(context, ScreenTwo.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chats'),
              onTap: () {
                Navigator.pushNamed(context, ScreenThree.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Screen One', style: TextStyle(fontSize: 50))),
          // Center(
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, ScreenTwo.id);
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) => ScreenTwo()),
          //       // );
          //     },
          //     child: Text('Screen 1'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
