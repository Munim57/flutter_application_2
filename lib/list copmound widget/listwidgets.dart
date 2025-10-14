import 'package:flutter/material.dart';

class ProfileCircle extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;

  const ProfileCircle({
    required this.imagePath,
    required this.name,
    required this.role,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
            const Icon(Icons.mic, color: Colors.blue, size: 12),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(role, style: const TextStyle(color: Colors.grey, fontSize: 10)),
      ],
    );
  }
}

/////////////////////////////////////////////////////////
// ✅ Correct entry point to run the app
void main() {
  runApp(const ProfilesListView());
}

class ProfilesListView extends StatelessWidget {
  const ProfilesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> profiles = [
      {'image': 'assets/pic1.jpg', 'name': 'Mentisa', 'role': 'Guest'},
      {'image': 'assets/pic2.jpg', 'name': 'Alisha', 'role': 'Guest'},
      {'image': 'assets/pic3.jpg', 'name': 'Hadra', 'role': 'Guest'},
      {'image': 'assets/pic4.jpg', 'name': 'Furqa', 'role': 'Guest'},
      {'image': 'assets/pic5.jpg', 'name': 'Ryan', 'role': 'Guest'},
      {'image': 'assets/pic6.jpg', 'name': 'Raju', 'role': 'Guest'},
      {'image': 'assets/pic7.jpg', 'name': 'Nukra', 'role': 'Speaker'},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Center(child: Text('Listwidgets')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // first row
                SizedBox(
                  height: 90,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4, // show only first 4 profiles
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final p = profiles[index];
                      return ProfileCircle(
                        imagePath: p['image']!,
                        name: p['name']!,
                        role: p['role']!,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),

                // second row
                SizedBox(
                  height: 90,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: profiles.length - 4 + 1, // +1 for "+77"
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      if (index == profiles.length - 4) {
                        return Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xff0D0D2B),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '+77',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }
                      final p = profiles[index + 4];
                      return ProfileCircle(
                        imagePath: p['image']!,
                        name: p['name']!,
                        role: p['role']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
