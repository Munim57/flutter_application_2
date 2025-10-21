import 'dart:ui';
import 'package:flutter/material.dart';

// ---------------------- PROFILE CIRCLE --------------------------
class ProfileCircle extends StatefulWidget {
  final String imagePath; // image path
  final String name1; // role
  final String name; // name below the image
  final double size; // size of the circle

  const ProfileCircle({
    required this.name1,
    required this.imagePath,
    required this.name,
    required this.size,
    super.key,
  });

  @override
  State<ProfileCircle> createState() => _ProfileCircleState();
}

class _ProfileCircleState extends State<ProfileCircle> {
  bool isMicOn = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
              alignment: const Alignment(-1, 0),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isMicOn = !isMicOn;
                });
              },
              child: Icon(
                isMicOn ? Icons.mic : Icons.mic_off,
                color: const Color(0xff3626EB),
                size: 12,
              ),
            ),
            const SizedBox(width: 1.5),
            Text(
              widget.name,
              style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 9.48,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          widget.name1,
          style: const TextStyle(
            fontSize: 9.48,
            color: Color(0xffA5A5A5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ---------------------- MAIN APP --------------------------
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilesListView(),
    ),
  );
}

class ProfilesListView extends StatelessWidget {
  const ProfilesListView({super.key});

  final List<Map<String, String>> profiles = const [
    {'image': 'assets/spider.jpg', 'name': 'Mentisa', 'role': 'Guest'},
    {'image': 'assets/wind.jpg', 'name': 'Alisha', 'role': 'Guest'},
    {'image': 'assets/spider.jpg', 'name': 'Mentisa', 'role': 'Guest'},
  ];

  void _showProfilesDialog(
    BuildContext context,
    List<Map<String, String>> extras,
  ) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (_, __, ___) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.85),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Center(
            child: Text(
              'More Profiles',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 400, // limits dialog height
              minHeight: 100,
            ),
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 3,
              radius: const Radius.circular(10),
              child: SingleChildScrollView(
                child: Column(
                  children: extras.map((p) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(p['image']!),
                          ),
                          title: Text(
                            p['name']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            p['role']!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const Divider(color: Colors.white24),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstRow = profiles.take(6).toList();
    final remaining = profiles.skip(6).toList();
    final secondRow = remaining.take(5).toList();
    final extraProfiles = remaining.skip(5).toList();
    final extraCount = extraProfiles.length;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile Grid Example'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔹 First Row
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: firstRow.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final p = firstRow[index];
                  return ProfileCircle(
                    imagePath: p['image']!,
                    name: p['name']!,
                    name1: p['role']!,
                    size: 60,
                  );
                },
              ),
            ),
            const SizedBox(height: 25),

            // 🔹 Second Row
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: secondRow.length + (extraCount > 0 ? 1 : 0),
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  if (index < secondRow.length) {
                    final p = secondRow[index];
                    return ProfileCircle(
                      imagePath: p['image']!,
                      name: p['name']!,
                      name1: p['role']!,
                      size: 60,
                    );
                  } else {
                    // "+X" Container for remaining profiles
                    return GestureDetector(
                      onTap: () => _showProfilesDialog(context, extraProfiles),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xff0D0D2B),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '+$extraCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// /////////////////////////////////////////

// import 'dart:ui';
// import 'package:flutter/material.dart';

// class ProfileCircle extends StatelessWidget {
//   final String imagePath;
//   final String name;
//   final String role;
//   final bool micOn;
//   final VoidCallback onMicToggle;

//   const ProfileCircle({
//     required this.imagePath,
//     required this.name,
//     required this.role,
//     required this.micOn,
//     required this.onMicToggle,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           alignment: Alignment.bottomRight,
//           children: [
//             CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
//             GestureDetector(
//               onTap: onMicToggle,
//               child: Icon(
//                 Icons.mic,
//                 color: micOn ? Colors.blue : Colors.grey,
//                 size: 14,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 4),
//         Text(
//           name,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         Text(role, style: const TextStyle(color: Colors.grey, fontSize: 10)),
//       ],
//     );
//   }
// }

// /////////////////////////////////////////////////////////

// void main() {
//   runApp(const ProfilesListView());
// }

// class ProfilesListView extends StatefulWidget {
//   const ProfilesListView({super.key});

//   @override
//   State<ProfilesListView> createState() => _ProfilesListViewState();
// }

// class _ProfilesListViewState extends State<ProfilesListView> {
//   final List<Map<String, String>> profiles = [
//     {'image': 'assets/spider.jpg', 'name': 'Mentisa', 'role': 'Guest'},
//     {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
//     {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
//     {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
//     {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
//     {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
//     {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
//     {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
//     {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
//     {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
//     {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
//     {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
//     {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
//     {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
//     {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
//     {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
//     {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
//     {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
//     {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
//     {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
//     {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
//     {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
//     {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
//     {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
//     {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
//     {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
//     {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
//     {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
//     {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
//     {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
//     {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
//     {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
//     {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
//     {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
//     {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
//     {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
//     {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
//     {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
//     {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
//     {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
//     {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
//     {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
//     {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
//     {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
//     {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
//   ];

//   late List<bool> micStatus; // Store mic on/off states

//   @override
//   void initState() {
//     super.initState();
//     micStatus = List.generate(profiles.length, (_) => true); // all mics on
//   }

//   @override
//   Widget build(BuildContext context) {
//     final firstRow = profiles.take(6).toList();
//     final remaining = profiles.skip(6).toList();
//     final secondRow = remaining.take(5).toList();
//     final extraProfiles = remaining.skip(5).toList();
//     final extraCount = extraProfiles.length;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           backgroundColor: Colors.blueAccent,
//           title: const Center(child: Text('Mic Toggle with Dialog')),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // 🔹 First horizontal row
//               SizedBox(
//                 height: 100,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: firstRow.length,
//                   separatorBuilder: (_, __) => const SizedBox(width: 5),
//                   itemBuilder: (context, index) {
//                     final p = firstRow[index];
//                     return ProfileCircle(
//                       imagePath: p['image']!,
//                       name: p['name']!,
//                       role: p['role']!,
//                       micOn: micStatus[index],
//                       onMicToggle: () {
//                         setState(() {
//                           micStatus[index] = !micStatus[index];
//                         });
//                       },
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // 🔹 Second horizontal row
//               SizedBox(
//                 height: 100,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: secondRow.length + (extraCount > 0 ? 1 : 0),
//                   separatorBuilder: (_, __) => const SizedBox(width: 5),
//                   itemBuilder: (context, index) {
//                     if (index < secondRow.length) {
//                       final p = secondRow[index];
//                       final realIndex = 6 + index;
//                       return ProfileCircle(
//                         imagePath: p['image']!,
//                         name: p['name']!,
//                         role: p['role']!,
//                         micOn: micStatus[realIndex],
//                         onMicToggle: () {
//                           setState(() {
//                             micStatus[realIndex] = !micStatus[realIndex];
//                           });
//                         },
//                       );
//                     } else {
//                       // "+X" container opens dialog
//                       return GestureDetector(
//                         onTap: () {
//                           _showProfilesDialog(context, extraProfiles);
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 35),
//                           child: Container(
//                             height: 60,
//                             width: 60,
//                             decoration: const BoxDecoration(
//                               color: Color(0xff0D0D2B),
//                               shape: BoxShape.circle,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 '+$extraCount',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 🔹 Dialog with vertical list + mic toggle
//   void _showProfilesDialog(
//     BuildContext context,
//     List<Map<String, String>> extraProfiles,
//   ) {
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: '',
//       pageBuilder: (_, __, ___) => BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: AlertDialog(
//           backgroundColor: Colors.black.withOpacity(0.7),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           title: const Center(
//             child: Text(
//               'More Profiles',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           content: SizedBox(
//             width: double.maxFinite,
//             height: 350,
//             child: ListView.separated(
//               itemCount: extraProfiles.length,
//               separatorBuilder: (_, __) => const Divider(color: Colors.white24),
//               itemBuilder: (context, i) {
//                 final realIndex = 11 + i; // Adjust to match original list index
//                 final p = extraProfiles[i];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: AssetImage(p['image']!),
//                   ),
//                   title: Text(
//                     p['name']!,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   subtitle: Text(
//                     p['role']!,
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                   trailing: IconButton(
//                     icon: Icon(
//                       Icons.mic,
//                       color: micStatus[realIndex] ? Colors.blue : Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         micStatus[realIndex] = !micStatus[realIndex];
//                       });
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// ///////////////////////////////////////////////////////////////////////////////////


// // import 'dart:ui';
// // import 'package:flutter/material.dart';

// // class ProfileCircle extends StatelessWidget {
// //   final String imagePath;
// //   final String name;
// //   final String role;

// //   const ProfileCircle({
// //     required this.imagePath,
// //     required this.name,
// //     required this.role,
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Stack(
// //           alignment: Alignment.bottomRight,
// //           children: [
// //             CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
// //             const Icon(Icons.mic, color: Colors.blue, size: 12),
// //           ],
// //         ),
// //         const SizedBox(height: 4),
// //         Text(
// //           name,
// //           style: const TextStyle(
// //             color: Colors.white,
// //             fontSize: 12,
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //         Text(role, style: const TextStyle(color: Colors.grey, fontSize: 10)),
// //       ],
// //     );
// //   }
// // }

// // /////////////////////////////////////////////////////////

// // void main() {
// //   runApp(const ProfilesListView());
// // }

// // class ProfilesListView extends StatelessWidget {
// //   const ProfilesListView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final List<Map<String, String>> profiles = [
// //       {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
// //       {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
// //       {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
// //       {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
// //       {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
// //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// //     ];

// //     final firstRow = profiles.take(6).toList();
// //     final remaining = profiles.skip(6).toList();
// //     final secondRow = remaining.take(5).toList();
// //     final extraProfiles = remaining.skip(5).toList();
// //     final extraCount = extraProfiles.length;

// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         backgroundColor: Colors.black,
// //         appBar: AppBar(
// //           backgroundColor: Colors.blueAccent,
// //           title: const Center(child: Text('Dialog with Blur Background')),
// //         ),
// //         body: Padding(
// //           padding: const EdgeInsets.all(16),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               SizedBox(
// //                 height: 100,
// //                 child: ListView.separated(
// //                   scrollDirection: Axis.horizontal,
// //                   itemCount: firstRow.length,
// //                   separatorBuilder: (_, __) => const SizedBox(width: 10),
// //                   itemBuilder: (context, index) {
// //                     final p = firstRow[index];
// //                     return ProfileCircle(
// //                       imagePath: p['image']!,
// //                       name: p['name']!,
// //                       role: p['role']!,
// //                     );
// //                   },
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               SizedBox(
// //                 height: 100,
// //                 child: ListView.separated(
// //                   scrollDirection: Axis.horizontal,
// //                   itemCount: secondRow.length + (extraCount > 0 ? 1 : 0),
// //                   separatorBuilder: (_, __) => const SizedBox(width: 10),
// //                   itemBuilder: (context, index) {
// //                     if (index < secondRow.length) {
// //                       final p = secondRow[index];
// //                       return ProfileCircle(
// //                         imagePath: p['image']!,
// //                         name: p['name']!,
// //                         role: p['role']!,
// //                       );
// //                     } else {
// //                       // 🔹 "+X" Circle (shows dialog)
// //                       return GestureDetector(
// //                         onTap: () {
// //                           _showProfilesDialog(context, extraProfiles);
// //                         },
// //                         child: Container(
// //                           height: 60,
// //                           width: 60,
// //                           decoration: const BoxDecoration(
// //                             color: Color(0xff0D0D2B),
// //                             shape: BoxShape.circle,
// //                           ),
// //                           child: Center(
// //                             child: Text(
// //                               '+$extraCount',
// //                               style: const TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       );
// //                     }
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // 🔹 Custom Dialog with Blur Background
// //   void _showProfilesDialog(
// //     BuildContext context,
// //     List<Map<String, String>> extraProfiles,
// //   ) {
// //     showGeneralDialog(
// //       context: context,
// //       barrierDismissible: true,
// //       barrierLabel: '',
// //       pageBuilder: (_, __, ___) => BackdropFilter(
// //         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// //         child: AlertDialog(
// //           backgroundColor: Colors.black.withOpacity(0.6),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           title: const Center(
// //             child: Text(
// //               'More Profiles',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           ),
// //           content: SizedBox(
// //             width: double.maxFinite,
// //             height: 300,
// //             child: ListView.separated(
// //               itemCount: extraProfiles.length,
// //               separatorBuilder: (_, __) => const Divider(color: Colors.white24),
// //               itemBuilder: (context, index) {
// //                 final p = extraProfiles[index];
// //                 return ListTile(
// //                   leading: CircleAvatar(
// //                     backgroundImage: AssetImage(p['image']!),
// //                   ),
// //                   title: Text(
// //                     p['name']!,
// //                     style: const TextStyle(color: Colors.white),
// //                   ),
// //                   subtitle: Text(
// //                     p['role']!,
// //                     style: const TextStyle(color: Colors.grey),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }




// // // import 'dart:ui';
// // // import 'package:flutter/material.dart';

// // // class ProfileCircle extends StatelessWidget {
// // //   final String imagePath;
// // //   final String name;
// // //   final String role;

// // //   const ProfileCircle({
// // //     required this.imagePath,
// // //     required this.name,
// // //     required this.role,
// // //     super.key,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       children: [
// // //         Stack(
// // //           alignment: Alignment.bottomRight,
// // //           children: [
// // //             CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
// // //             const Icon(Icons.mic, color: Colors.blue, size: 12),
// // //           ],
// // //         ),
// // //         const SizedBox(height: 4),
// // //         Text(
// // //           name,
// // //           style: const TextStyle(
// // //             color: Colors.white,
// // //             fontSize: 12,
// // //             fontWeight: FontWeight.w500,
// // //           ),
// // //         ),
// // //         Text(role, style: const TextStyle(color: Colors.grey, fontSize: 10)),
// // //       ],
// // //     );
// // //   }
// // // }

// // // /////////////////////////////////////////////////////////

// // // void main() {
// // //   runApp(const ProfilesListView());
// // // }

// // // class ProfilesListView extends StatefulWidget {
// // //   const ProfilesListView({super.key});

// // //   @override
// // //   State<ProfilesListView> createState() => _ProfilesListViewState();
// // // }

// // // class _ProfilesListViewState extends State<ProfilesListView> {
// // //   bool showOverlay = false;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final List<Map<String, String>> profiles = [
// // //       {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
// // //       {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
// // //       {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
// // //       {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
// // //       {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
// // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// // //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// // //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// // //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// // //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// // //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// // //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// // //       {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
// // //       {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
// // //       {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
// // //       {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
// // //       {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
// // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// // //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// // //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// // //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// // //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// // //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// // //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// // //     ];

// // //     final firstRow = profiles.take(6).toList();
// // //     final remaining = profiles.skip(6).toList();
// // //     final secondRow = remaining.take(5).toList();
// // //     final extraProfiles = remaining.skip(5).toList();
// // //     final extraCount = extraProfiles.length;

// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: Scaffold(
// // //         backgroundColor: Colors.black,
// // //         appBar: AppBar(
// // //           backgroundColor: Colors.blueAccent,
// // //           title: const Center(child: Text('Blur Overlay Profiles')),
// // //         ),
// // //         body: Stack(
// // //           children: [
// // //             // 🔹 Base content (two rows)
// // //             Padding(
// // //               padding: const EdgeInsets.all(16),
// // //               child: Column(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: [
// // //                   SizedBox(
// // //                     height: 100,
// // //                     child: ListView.separated(
// // //                       scrollDirection: Axis.horizontal,
// // //                       itemCount: firstRow.length,
// // //                       separatorBuilder: (_, __) => const SizedBox(width: 10),
// // //                       itemBuilder: (context, index) {
// // //                         final p = firstRow[index];
// // //                         return ProfileCircle(
// // //                           imagePath: p['image']!,
// // //                           name: p['name']!,
// // //                           role: p['role']!,
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   SizedBox(
// // //                     height: 100,
// // //                     child: ListView.separated(
// // //                       scrollDirection: Axis.horizontal,
// // //                       itemCount: secondRow.length + (extraCount > 0 ? 1 : 0),
// // //                       separatorBuilder: (_, __) => const SizedBox(width: 10),
// // //                       itemBuilder: (context, index) {
// // //                         if (index < secondRow.length) {
// // //                           final p = secondRow[index];
// // //                           return ProfileCircle(
// // //                             imagePath: p['image']!,
// // //                             name: p['name']!,
// // //                             role: p['role']!,
// // //                           );
// // //                         } else {
// // //                           // 🔹 "+X" Circle (opens overlay)
// // //                           return GestureDetector(
// // //                             onTap: () {
// // //                               setState(() {
// // //                                 showOverlay = true;
// // //                               });
// // //                             },
// // //                             child: Container(
// // //                               height: 60,
// // //                               width: 60,
// // //                               decoration: const BoxDecoration(
// // //                                 color: Color(0xff0D0D2B),
// // //                                 shape: BoxShape.circle,
// // //                               ),
// // //                               child: Center(
// // //                                 child: Text(
// // //                                   '+$extraCount',
// // //                                   style: const TextStyle(
// // //                                     color: Colors.white,
// // //                                     fontSize: 18,
// // //                                     fontWeight: FontWeight.bold,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           );
// // //                         }
// // //                       },
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),

// // //             // 🔹 BLUR OVERLAY (appears when +X tapped)
// // //             if (showOverlay)
// // //               AnimatedOpacity(
// // //                 opacity: showOverlay ? 1 : 0,
// // //                 duration: const Duration(milliseconds: 300),
// // //                 child: GestureDetector(
// // //                   onTap: () {
// // //                     setState(() {
// // //                       showOverlay = false;
// // //                     });
// // //                   },
// // //                   child: Container(
// // //                     width: double.infinity,
// // //                     height: double.infinity,
// // //                     child: Stack(
// // //                       children: [
// // //                         // 🔸 Blur background
// // //                         BackdropFilter(
// // //                           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // //                           child: Container(
// // //                             color: Colors.black.withOpacity(0.6),
// // //                           ),
// // //                         ),
// // //                         // 🔸 Foreground scrollable profiles
// // //                         Center(
// // //                           child: Container(
// // //                             width: 320,
// // //                             height: 400,
// // //                             decoration: BoxDecoration(
// // //                               color: Colors.black.withOpacity(0.5),
// // //                               borderRadius: BorderRadius.circular(20),
// // //                               border: Border.all(color: Colors.white24),
// // //                             ),
// // //                             child: Column(
// // //                               children: [
// // //                                 Padding(
// // //                                   padding: const EdgeInsets.symmetric(
// // //                                     vertical: 12,
// // //                                   ),
// // //                                   child: Row(
// // //                                     mainAxisAlignment:
// // //                                         MainAxisAlignment.spaceBetween,
// // //                                     children: [
// // //                                       const SizedBox(width: 40),
// // //                                       const Text(
// // //                                         'More Profiles',
// // //                                         style: TextStyle(
// // //                                           color: Colors.white,
// // //                                           fontSize: 16,
// // //                                           fontWeight: FontWeight.bold,
// // //                                         ),
// // //                                       ),
// // //                                       IconButton(
// // //                                         icon: const Icon(
// // //                                           Icons.close,
// // //                                           color: Colors.white,
// // //                                         ),
// // //                                         onPressed: () {
// // //                                           setState(() {
// // //                                             showOverlay = false;
// // //                                           });
// // //                                         },
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //                                 Expanded(
// // //                                   child: ListView.separated(
// // //                                     padding: const EdgeInsets.all(8),
// // //                                     itemCount: extraProfiles.length,
// // //                                     separatorBuilder: (_, __) =>
// // //                                         const Divider(color: Colors.white24),
// // //                                     itemBuilder: (context, index) {
// // //                                       final p = extraProfiles[index];
// // //                                       return ListTile(
// // //                                         leading: CircleAvatar(
// // //                                           backgroundImage: AssetImage(
// // //                                             p['image']!,
// // //                                           ),
// // //                                         ),
// // //                                         title: Text(
// // //                                           p['name']!,
// // //                                           style: const TextStyle(
// // //                                             color: Colors.white,
// // //                                           ),
// // //                                         ),
// // //                                         subtitle: Text(
// // //                                           p['role']!,
// // //                                           style: const TextStyle(
// // //                                             color: Colors.grey,
// // //                                           ),
// // //                                         ),
// // //                                       );
// // //                                     },
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }


// // // // import 'package:flutter/material.dart';

// // // // class ProfileCircle extends StatelessWidget {
// // // //   final String imagePath;
// // // //   final String name;
// // // //   final String role;

// // // //   const ProfileCircle({
// // // //     required this.imagePath,
// // // //     required this.name,
// // // //     required this.role,
// // // //     super.key,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Column(
// // // //       children: [
// // // //         Stack(
// // // //           alignment: Alignment.bottomRight,
// // // //           children: [
// // // //             CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
// // // //             const Icon(Icons.mic, color: Colors.blue, size: 12),
// // // //           ],
// // // //         ),
// // // //         const SizedBox(height: 4),
// // // //         Text(
// // // //           name,
// // // //           style: const TextStyle(
// // // //             color: Colors.white,
// // // //             fontSize: 12,
// // // //             fontWeight: FontWeight.w500,
// // // //           ),
// // // //         ),
// // // //         Text(role, style: const TextStyle(color: Colors.grey, fontSize: 10)),
// // // //       ],
// // // //     );
// // // //   }
// // // // }

// // // // /////////////////////////////////////////////////////////

// // // // void main() {
// // // //   runApp(const ProfilesListView());
// // // // }

// // // // class ProfilesListView extends StatefulWidget {
// // // //   const ProfilesListView({super.key});

// // // //   @override
// // // //   State<ProfilesListView> createState() => _ProfilesListViewState();
// // // // }

// // // // class _ProfilesListViewState extends State<ProfilesListView> {
// // // //   bool showExtraProfiles = false;

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final List<Map<String, String>> profiles = [
// // // //       {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
// // // //       {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
// // // //       {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
// // // //       {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
// // // //       {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
// // // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// // // //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// // // //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// // // //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// // // //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// // // //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// // // //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// // // //       {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
// // // //       {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
// // // //       {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
// // // //       {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
// // // //       {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
// // // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// // // //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// // // //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// // // //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// // // //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// // // //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// // // //       {'image': 'assets/pic14.jpg', 'name': 'Sara', 'role': 'Guest'},
// // // //     ];

// // // //     final firstRow = profiles.take(6).toList();
// // // //     final remaining = profiles.skip(6).toList();
// // // //     final secondRow = remaining.take(5).toList();
// // // //     final extraProfiles = remaining.skip(5).toList();
// // // //     final extraCount = extraProfiles.length;

// // // //     return MaterialApp(
// // // //       debugShowCheckedModeBanner: false,
// // // //       home: Scaffold(
// // // //         backgroundColor: Colors.black,
// // // //         appBar: AppBar(
// // // //           backgroundColor: Colors.blueAccent,
// // // //           title: const Center(child: Text('Profiles Layout')),
// // // //         ),
// // // //         body: Padding(
// // // //           padding: const EdgeInsets.all(16),
// // // //           child: Column(
// // // //             mainAxisSize: MainAxisSize.min,
// // // //             children: [
// // // //               // 🔹 Row 1
// // // //               SizedBox(
// // // //                 height: 100,
// // // //                 child: ListView.separated(
// // // //                   scrollDirection: Axis.horizontal,
// // // //                   itemCount: firstRow.length,
// // // //                   separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // //                   itemBuilder: (context, index) {
// // // //                     final p = firstRow[index];
// // // //                     return ProfileCircle(
// // // //                       imagePath: p['image']!,
// // // //                       name: p['name']!,
// // // //                       role: p['role']!,
// // // //                     );
// // // //                   },
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 20),

// // // //               // 🔹 Row 2
// // // //               SizedBox(
// // // //                 height: 100,
// // // //                 child: ListView.separated(
// // // //                   scrollDirection: Axis.horizontal,
// // // //                   itemCount: secondRow.length + (extraCount > 0 ? 1 : 0),
// // // //                   separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // //                   itemBuilder: (context, index) {
// // // //                     if (index < secondRow.length) {
// // // //                       final p = secondRow[index];
// // // //                       return ProfileCircle(
// // // //                         imagePath: p['image']!,
// // // //                         name: p['name']!,
// // // //                         role: p['role']!,
// // // //                       );
// // // //                     } else {
// // // //                       // 🔹 The "+X" circle
// // // //                       return GestureDetector(
// // // //                         onTap: () {
// // // //                           setState(() {
// // // //                             showExtraProfiles = !showExtraProfiles;
// // // //                           });
// // // //                         },
// // // //                         child: AnimatedContainer(
// // // //                           duration: const Duration(milliseconds: 300),
// // // //                           height: 60,
// // // //                           width: 60,
// // // //                           decoration: const BoxDecoration(
// // // //                             color: Color(0xff0D0D2B),
// // // //                             shape: BoxShape.circle,
// // // //                           ),
// // // //                           child: Center(
// // // //                             child: Text(
// // // //                               showExtraProfiles ? '×' : '+$extraCount',
// // // //                               style: const TextStyle(
// // // //                                 color: Colors.white,
// // // //                                 fontSize: 18,
// // // //                                 fontWeight: FontWeight.bold,
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       );
// // // //                     }
// // // //                   },
// // // //                 ),
// // // //               ),

// // // //               // 🔹 Expandable extra profiles section
// // // //               if (showExtraProfiles && extraProfiles.isNotEmpty) ...[
// // // //                 const SizedBox(height: 20),
// // // //                 AnimatedContainer(
// // // //                   duration: const Duration(milliseconds: 300),
// // // //                   height: 250,
// // // //                   decoration: BoxDecoration(
// // // //                     color: Colors.grey[900],
// // // //                     borderRadius: BorderRadius.circular(12),
// // // //                   ),
// // // //                   child: ListView.separated(
// // // //                     padding: const EdgeInsets.all(10),
// // // //                     scrollDirection: Axis.vertical,
// // // //                     itemCount: extraProfiles.length,
// // // //                     separatorBuilder: (_, __) =>
// // // //                         const Divider(color: Colors.white24),
// // // //                     itemBuilder: (context, index) {
// // // //                       final p = extraProfiles[index];
// // // //                       return ListTile(
// // // //                         leading: CircleAvatar(
// // // //                           backgroundImage: AssetImage(p['image']!),
// // // //                         ),
// // // //                         title: Text(
// // // //                           p['name']!,
// // // //                           style: const TextStyle(color: Colors.white),
// // // //                         ),
// // // //                         subtitle: Text(
// // // //                           p['role']!,
// // // //                           style: const TextStyle(color: Colors.grey),
// // // //                         ),
// // // //                       );
// // // //                     },
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }


// // // // /////////////////////////////////////////////////////////////////////////////////


// // // // // import 'package:flutter/material.dart';

// // // // // class ProfileCircle extends StatelessWidget {
// // // // //   final String imagePath;
// // // // //   final String name;
// // // // //   final String role;

// // // // //   const ProfileCircle({
// // // // //     required this.imagePath,
// // // // //     required this.name,
// // // // //     required this.role,
// // // // //     super.key,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Column(
// // // // //       children: [
// // // // //         Stack(
// // // // //           alignment: Alignment.bottomRight,
// // // // //           children: [
// // // // //             CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
// // // // //             const Icon(Icons.mic, color: Colors.blue, size: 12),
// // // // //           ],
// // // // //         ),
// // // // //         const SizedBox(height: 4),
// // // // //         Text(
// // // // //           name,
// // // // //           style: const TextStyle(
// // // // //             color: Colors.white,
// // // // //             fontSize: 12,
// // // // //             fontWeight: FontWeight.w500,
// // // // //           ),
// // // // //         ),
// // // // //         Text(role, style: const TextStyle(color: Colors.grey, fontSize: 10)),
// // // // //       ],
// // // // //     );
// // // // //   }
// // // // // }

// // // // // /////////////////////////////////////////////////////////

// // // // // void main() {
// // // // //   runApp(const ProfilesListView());
// // // // // }

// // // // // class ProfilesListView extends StatelessWidget {
// // // // //   const ProfilesListView({super.key});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final List<Map<String, String>> profiles = [
// // // // //       {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // // //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// // // // //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // // //       {'image': 'assets/pic8.jpg', 'name': 'Aliya', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic9.jpg', 'name': 'Sameer', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic10.jpg', 'name': 'Lina', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic11.jpg', 'name': 'Zain', 'role': 'Speaker'},
// // // // //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic12.jpg', 'name': 'Noor', 'role': 'Guest'},
// // // // //       {'image': 'assets/pic13.jpg', 'name': 'Khalid', 'role': 'Guest'},
// // // // //     ];

// // // // //     // 🔹 Split profiles into two groups
// // // // //     final firstRow = profiles.take(6).toList();
// // // // //     final remaining = profiles.skip(6).toList();

// // // // //     // 🔹 From remaining, take only 5 for second row
// // // // //     final secondRow = remaining.take(5).toList();
// // // // //     final extraCount = remaining.length - 5; // extra profiles beyond 5

// // // // //     return MaterialApp(
// // // // //       debugShowCheckedModeBanner: false,
// // // // //       home: Scaffold(
// // // // //         backgroundColor: Colors.black,
// // // // //         appBar: AppBar(
// // // // //           backgroundColor: Colors.blueAccent,
// // // // //           title: const Center(child: Text('Profiles Layout')),
// // // // //         ),
// // // // //         body: Padding(
// // // // //           padding: const EdgeInsets.all(16),
// // // // //           child: Column(
// // // // //             mainAxisSize: MainAxisSize.min,
// // // // //             children: [
// // // // //               // 🔹 Row 1 — first 6 profiles
// // // // //               SizedBox(
// // // // //                 height: 100,
// // // // //                 child: ListView.separated(
// // // // //                   scrollDirection: Axis.horizontal,
// // // // //                   itemCount: firstRow.length,
// // // // //                   separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // //                   itemBuilder: (context, index) {
// // // // //                     final p = firstRow[index];
// // // // //                     return ProfileCircle(
// // // // //                       imagePath: p['image']!,
// // // // //                       name: p['name']!,
// // // // //                       role: p['role']!,
// // // // //                     );
// // // // //                   },
// // // // //                 ),
// // // // //               ),
// // // // //               const SizedBox(height: 20),

// // // // //               // 🔹 Row 2 — next 5 + optional "+X" container
// // // // //               SizedBox(
// // // // //                 height: 100,
// // // // //                 child: ListView.separated(
// // // // //                   scrollDirection: Axis.horizontal,
// // // // //                   itemCount: secondRow.length + (extraCount > 0 ? 1 : 0),
// // // // //                   separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // //                   itemBuilder: (context, index) {
// // // // //                     if (index < secondRow.length) {
// // // // //                       final p = secondRow[index];
// // // // //                       return ProfileCircle(
// // // // //                         imagePath: p['image']!,
// // // // //                         name: p['name']!,
// // // // //                         role: p['role']!,
// // // // //                       );
// // // // //                     } else {
// // // // //                       // 🔹 "+X" container for extra profiles
// // // // //                       return Container(
// // // // //                         height: 60,
// // // // //                         width: 60,
// // // // //                         decoration: const BoxDecoration(
// // // // //                           color: Color(0xff0D0D2B),
// // // // //                           shape: BoxShape.circle,
// // // // //                         ),
// // // // //                         child: Center(
// // // // //                           child: Text(
// // // // //                             '+$extraCount',
// // // // //                             style: const TextStyle(
// // // // //                               color: Colors.white,
// // // // //                               fontSize: 16,
// // // // //                               fontWeight: FontWeight.bold,
// // // // //                             ),
// // // // //                           ),
// // // // //                         ),
// // // // //                       );
// // // // //                     }
// // // // //                   },
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }


// // // // ///////////////////////////////////////////////////////////////////


// // // // // // import 'package:flutter/material.dart';

// // // // // // class ProfileCircle extends StatelessWidget {
// // // // // //   final String imagePath;
// // // // // //   final String name;
// // // // // //   final String role;

// // // // // //   const ProfileCircle({
// // // // // //     required this.imagePath,
// // // // // //     required this.name,
// // // // // //     required this.role,
// // // // // //     super.key,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Column(
// // // // // //       children: [
// // // // // //         Stack(
// // // // // //           alignment: Alignment.bottomRight,
// // // // // //           children: [
// // // // // //             CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
// // // // // //             const Icon(Icons.mic, color: Colors.blue, size: 12),
// // // // // //           ],
// // // // // //         ),
// // // // // //         const SizedBox(height: 4),
// // // // // //         Text(
// // // // // //           name,
// // // // // //           style: const TextStyle(
// // // // // //             color: Colors.white,
// // // // // //             fontSize: 12,
// // // // // //             fontWeight: FontWeight.w500,
// // // // // //           ),
// // // // // //         ),
// // // // // //         Text(role, style: const TextStyle(color: Colors.grey, fontSize: 10)),
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // /////////////////////////////////////////////////////////

// // // // // // void main() {
// // // // // //   runApp(const ProfilesListView());
// // // // // // }

// // // // // // class ProfilesListView extends StatelessWidget {
// // // // // //   const ProfilesListView({super.key});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final List<Map<String, String>> profiles = [
// // // // // //       {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // // // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // // // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // // // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // // // //       {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
// // // // // //       {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
// // // // // //     ];

// // // // // //     return MaterialApp(
// // // // // //       debugShowCheckedModeBanner: false,
// // // // // //       home: Scaffold(
// // // // // //         backgroundColor: Colors.black,
// // // // // //         appBar: AppBar(
// // // // // //           backgroundColor: Colors.blueAccent,
// // // // // //           title: const Center(child: Text('List Widgets')),
// // // // // //         ),
// // // // // //         body: Padding(
// // // // // //           padding: const EdgeInsets.all(16),
// // // // // //           child: Column(
// // // // // //             mainAxisSize: MainAxisSize.min,
// // // // // //             children: [
// // // // // //               // 🔹 First horizontal row
// // // // // //               SizedBox(
// // // // // //                 height: 100,
// // // // // //                 child: ListView.separated(
// // // // // //                   scrollDirection: Axis.horizontal,
// // // // // //                   itemCount: 6,
// // // // // //                   separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // //                   itemBuilder: (context, index) {
// // // // // //                     final p = profiles[index];
// // // // // //                     return ProfileCircle(
// // // // // //                       imagePath: p['image']!,
// // // // // //                       name: p['name']!,
// // // // // //                       role: p['role']!,
// // // // // //                     );
// // // // // //                   },
// // // // // //                 ),
// // // // // //               ),
// // // // // //               const SizedBox(height: 20),

// // // // // //               // 🔹 Second horizontal row
// // // // // //               SizedBox(
// // // // // //                 height: 100,
// // // // // //                 child: ListView.separated(
// // // // // //                   scrollDirection: Axis.horizontal,
// // // // // //                   itemCount: profiles.length - 6 + 1,
// // // // // //                   separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // //                   itemBuilder: (context, index) {
// // // // // //                     if (index == profiles.length - 6) {
// // // // // //                       return Container(
// // // // // //                         height: 40,
// // // // // //                         width: 40,
// // // // // //                         decoration: const BoxDecoration(
// // // // // //                           color: Color(0xff0D0D2B),
// // // // // //                           shape: BoxShape.circle,
// // // // // //                         ),
// // // // // //                         child: const Center(
// // // // // //                           child: Text(
// // // // // //                             '+77',
// // // // // //                             style: TextStyle(
// // // // // //                               color: Colors.white,
// // // // // //                               fontSize: 16,
// // // // // //                               fontWeight: FontWeight.bold,
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       );
// // // // // //                     }
// // // // // //                     final p = profiles[index + 6];
// // // // // //                     return ProfileCircle(
// // // // // //                       imagePath: p['image']!,
// // // // // //                       name: p['name']!,
// // // // // //                       role: p['role']!,
// // // // // //                     );
// // // // // //                   },
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
