import 'package:flutter/material.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({super.key});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  int _selectedIndex = 0;
  final List<Widget> _screen = [
    Center(child: Text('Live')),
    Center(child: Text('Chat')),
    Center(child: Text('Explore')),
    Center(child: Text('Events')),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _screen[_selectedIndex],

        //for pecfect navigations
        //body: IndexedStack(index:_selectedIndex,chlidren:_screen),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Color(0xff121212),
            iconTheme: WidgetStateProperty.all(
              IconThemeData(color: Colors.white),
            ),
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),

          child: NavigationBar(
            onDestinationSelected: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            selectedIndex: _selectedIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.phone), label: 'Live'),
              NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
              NavigationDestination(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              NavigationDestination(icon: Icon(Icons.event), label: 'Events'),
            ],
          ),
        ),
      ),
    );
  }
}



























































// import 'package:flutter/material.dart';

// class NavigatorBottom extends StatefulWidget {
//   const NavigatorBottom({super.key});

//   @override
//   State<NavigatorBottom> createState() => _NavigatorBottomState();
// }

// class _NavigatorBottomState extends State<NavigatorBottom> {
//   int _selectedIndex = 0; // default  active tab
//   final List<Widget> _screen = [
//     Center(child: Text('📞 Live Screen')),
//     Center(child: Text('💬 Chats Screen')),
//     Center(child: Text('🧭 Explore Screen')),
//     Center(child: Text('📅 Events Screen')),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: _screen[_selectedIndex],

//         bottomNavigationBar: NavigationBar(
//           onDestinationSelected: (value) {
//             setState(() {
//               _selectedIndex = value;
//             });
//           },
//           selectedIndex: _selectedIndex,

//           backgroundColor: Color(0xff121212),
          
//           labelTextStyle: MaterialStateProperty.all(
//             TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           destinations: [
//             NavigationDestination(
//               icon: Icon(Icons.phone, color: Colors.white),
//               label: 'Live',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
//               label: 'Chat',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.explore, color: Colors.white),
//               label: 'Explore',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.event, color: Colors.white),
//               label: 'Events',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
