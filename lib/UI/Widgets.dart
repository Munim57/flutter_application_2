import 'package:flutter/material.dart';

class ContainerApp extends StatelessWidget {
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: Text('ContainerApp')),
        ),
        body: Column(
          // column use for vertical alignment and row use for horizantel alignment
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 200,

                    child: Center(child: Text('Container 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.green,
                    child: Center(child: Text('Container 2')),
                  ),
                ),
              ],
            ),
            Center(
              // use for center the container
              child:
                  //use for create container and use for design and style and box decoration and many more
                  //and also use for size height and width and its expalnation below about container properties
                  Container(
                    height: 200,
                    width: 150,

                    // transform: Matrix4.rotationZ(.2),          // use for rotate
                    // margin: EdgeInsets.only(right: 0, left: 0),      // use for outside space
                    //padding: EdgeInsets.all(30),     // use for inside space for any text or widget
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(
                        20,
                      ), // use for container border radius
                      // borderRadius: BorderRadius.only(
                      //   topRight: Radius.circular(50),

                      //   bottomLeft: Radius.circular(50),

                      //   topLeft: Radius.circular(10),

                      //   bottomRight: Radius.circular(10),
                      // ),
                      // border: Border.all(color: Colors.blue, width: 20),
                      image: DecorationImage(
                        fit: BoxFit
                            .fill, // use for image fit in container and use for image cover full container

                        image: NetworkImage(
                          'https://images.pexels.com/photos/15920486/pexels-photo-15920486.jpeg',
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 10,
                        ), // use for shadow effect for container
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Login 1',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
