import 'package:flutter/material.dart';

class Widgetsapp extends StatefulWidget {
  const Widgetsapp({super.key});

  @override
  State<Widgetsapp> createState() => _WidgetsappState();
}

class _WidgetsappState extends State<Widgetsapp> {
  bool ishiddenpassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('WidgetsApp')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: TextFormField(
                cursorColor: Colors.red,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  hintStyle: TextStyle(color: Colors.black),
                  label: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                  fillColor: Colors.grey,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: TextField(
                obscureText: ishiddenpassword,
                cursorColor: Colors.red,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Password',
                  label: Text(
                    'Password',
                    style: TextStyle(color: Colors.black),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  fillColor: Colors.grey,
                  filled: true,
                  prefixIcon: Icon(Icons.lock_outline_sharp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      ishiddenpassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      ishiddenpassword = !ishiddenpassword;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////

//Drawer  //we use it in appBar before body 

  //  drawer: Drawer(
  //       child: ListView(
  //         padding: EdgeInsets.zero,
  //         children: [
  //           // DrawerHeader(child: Text('Munim')),
  //           UserAccountsDrawerHeader(
  //             decoration: BoxDecoration(color: Color(0xff764abc)),
  //             currentAccountPicture:
  //                 // Image(
  //                 //   image: NetworkImage(
  //                 //     'https://images.pexels.com/photos/2613260/pexels-photo-2613260.jpeg',
  //                 //   ),
  //                 // ),
  //                 CircleAvatar(
  //                   backgroundColor: Colors.blueGrey,
  //                   // backgroundImage: AssetImage('assets/spider.jpg'),
  //                   backgroundImage: NetworkImage(
  //                     'https://images.pexels.com/photos/2613260/pexels-photo-2613260.jpeg',
  //                   ),
  //                 ),
  //             accountName: Text('Abdul Munim'),
  //             accountEmail: Text('muxi13@gmail.com'),
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.home),
  //             title: Text('Page 1'),
  //             onTap: () {
  //               Navigator.pushNamed(context, HomeScreen.id);
  //             },
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.wifi_calling_3),
  //             title: Text('Calls '),
  //             onTap: () {
  //               Navigator.pushNamed(context, ScreenTwo.id);
  //             },
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.chat),
  //             title: Text('Chats'),
  //             onTap: () {
  //               Navigator.pushNamed(context, ScreenThree.id);
  //             },
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.image),
  //             title: Text('Images'),
  //             onTap: () {
  //               Navigator.pushNamed(context, ScreenLast.id);
  //             },
  //           ),
  //           ListTile(leading: Icon(Icons.logout), title: Text('Logout')),
  //         ],
  //       ),
  //     ),



/////////////////////////////////////////////////////////////////////////
//textformfield Visable and Hide Password

// Padding(
//             padding: const EdgeInsets.all(10),
//             child: Center(
//               child: TextField(
//                 obscureText: ishiddenpassword,
//                 cursorColor: Colors.red,
//                 keyboardType: TextInputType.visiblePassword,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   label: Text(
//                     'Password',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   fillColor: Colors.grey,
//                   filled: true,
//                   prefixIcon: Icon(Icons.lock_outline_sharp),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       ishiddenpassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () {
//                       ishiddenpassword = !ishiddenpassword;
//                       setState(() {});
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),




///////////////////////////////////////////////////////////////////////////
//ListTile and ListView.builder widgets

// Expanded(
//               child: ListView.builder(
//                 itemCount: 100,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       backgroundImage: NetworkImage(
//                         'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
//                       ),
//                     ),
//                     title: Text('Lora'),
//                     subtitle: Text('Thank You G...!'),
//                     trailing: Text('3:40 PM'),
//                   );
//                 },
//               ),
//             ),

///////////////////////////////////////////////////////////////////////
//TextFormField Widget

// Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 cursorColor: Colors.black,
//                 enabled: true,
//                 style: TextStyle(color: Colors.black, fontSize: 18),
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey.withOpacity(0.2),
//                   prefixIcon: Icon(Icons.email),
//                   hintText: 'Email',
//                   labelText: 'Email',
//                   hintStyle: TextStyle(
//                     color: Colors.grey.shade600,
//                     fontSize: 14,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                  
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green, width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                   ), focusedErrorBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   print(value);
//                 },
//               ),
//             ),












//////////////////////////////////////////////////////////////////////////////////////////// 

// RichText Widget

//  Center(
//               child: RichText( 
//                 text: TextSpan(
//                   text: 'Dont have an account?  ',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                   children: [
//                     TextSpan(
//                       text: 'Sign up',
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),




///////////////////////////////////////////////////////////////////////////////////////////

// Circle Avatar widget 

  //  Center(
  //             child: CircleAvatar(
  //               radius: 100,
  //               // maxRadius: 100,
  //               // minRadius: 50,
  //               backgroundColor: Colors.black,
  //               // child: Icon(Icons.person),
  //               backgroundImage: NetworkImage(
  //                 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
  //               ),
  //             ),
  //           ),





//////////////////////////////////////////////////////////////////////////////////////////////

// Divider widget

//  Divider(
//               color: Colors.black,
//               thickness: 0.5,
//             ), // use for divider the line
//             SizedBox(
//               height: 50,
//               child: VerticalDivider(color: Colors.black, thickness: 0.5),
//             ),
//             Divider(color: Colors.black, thickness: 0.5), 





////////////////////////////////////////////////////////////////////////////////////////

//Stack widget and positined widget and sizedbox widget and align widget 

//  Center(
//               child: SizedBox(
//                 child: Stack(
//                   // stack use for overlapping the container and widgets
//                   alignment: Alignment
//                       .center, // use for alignment the text in container
//                   children: [
//                     Container(
//                       height: 140,
//                       width: 140,
//                       color: Colors.red,
//                       child: Center(child: Text('Container 1')),
//                     ),
//                     Container(
//                       height: 120,
//                       width: 120,
//                       color: Colors.yellow,
//                       child: Center(child: Text('Container 2')),
//                     ),
//                     Container(
//                       height: 100,
//                       width: 100,
//                       color: Colors.green,
//                       child: Center(child: Text('Container 3')),
//                     ),
//                     Container(height: 80, width: 80, color: Colors.blue),
//                     Positioned(
//                       // top: 10,
//                       // bottom: 10,
//                       // right: 10,
//                       child: Text('Container'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),


///////////////////////////////////////////////////////////////////////////////////
//Expended widget

// Expanded(
//               flex: 9,
//               child: Container(
//                 height: 300,
//                 color: Colors.red,
//                 child: Center(child: Text('Container')),
//               ),
//             ),

////////////////
/// expended widget use for expanded the conatiner according to screen size
//  Expanded(
//                   // use for expand the container according to screen size
//                   flex:
//                       5, //  used for space according to flex value and its optional
//                   child: Container(
//                     color: Colors.red,

//                     height: 200,
//                     child: Center(child: Text('Container 1')),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     height: 200,
//                     color: Colors.green,
//                     child: Center(child: Text('Container 2')),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,

//                   child: Container(
//                     height: 200,
//                     color: Colors.blue,
//                     child: Center(child: Text('Container 3')),
//                   ),
//                 ),








//////////////////////////////////////////////////////////////////////
///cotainer properties
  // Center(
  //             // use for center the container
  //             child:
  //                 //use for create container and use for design and style and box decoration and many more
  //                 //and also use for size height and width and its expalnation below about container properties
  //                 Container(
  //                   height: 200,
  //                   width: 150,

  //                   // transform: Matrix4.rotationZ(.2),          // use for rotate
  //                   // margin: EdgeInsets.only(right: 0, left: 0),      // use for outside space
  //                   //padding: EdgeInsets.all(30),     // use for inside space for any text or widget
  //                   decoration: BoxDecoration(
  //                     color: Colors.orange,
  //                     borderRadius: BorderRadius.circular(
  //                       20,
  //                     ), // use for container border radius
  //                     // borderRadius: BorderRadius.only(
  //                     //   topRight: Radius.circular(50),

  //                     //   bottomLeft: Radius.circular(50),

  //                     //   topLeft: Radius.circular(10),

  //                     //   bottomRight: Radius.circular(10),
  //                     // ),
  //                     // border: Border.all(color: Colors.blue, width: 20),
  //                     image: DecorationImage(
  //                       fit: BoxFit
  //                           .fill, // use for image fit in container and use for image cover full container

  //                       image: NetworkImage(
  //                         'https://images.pexels.com/photos/15920486/pexels-photo-15920486.jpeg',
  //                       ),
  //                     ),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.blueGrey,
  //                         blurRadius: 10,
  //                       ), // use for shadow effect for container
  //                     ],
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       'Login 1',
  //                       style: TextStyle(color: Colors.white, fontSize: 30),
  //                     ),
  //                   ),
  //                 ),
  //           ),