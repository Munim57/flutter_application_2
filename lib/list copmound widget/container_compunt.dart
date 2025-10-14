import 'package:flutter/material.dart';

class ProfileCircle extends StatefulWidget {
  final String imagePath; //image path
  final String name1;
  final String name; //name below the image

  final double size; // size of the square

  ProfileCircle({
    required this.name1,
    super.key,
    required this.imagePath,
    required this.name,
    required this.size,
  });

  @override
  State<ProfileCircle> createState() => _ProfileCircleState();
}

class _ProfileCircleState extends State<ProfileCircle> {
  bool ismicon = true;

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
              fit: BoxFit.cover, // ensures the image covers the full circle
              alignment: Alignment(-1, 0),
            ),
          ),
        ),
        SizedBox(height: 2),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  ismicon = !ismicon; // toggle mic
                });
              },
              child: Icon(
                ismicon ? Icons.mic : Icons.mic_off,
                color: Color(0xff3626EB),
                size: 12,
              ),
              // child: Icon(widget.icon, color: Color(0xff3626EB), size: 12),
            ),
            SizedBox(width: 1.5),
            Text(
              widget.name,
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 9.48,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          widget.name1,
          style: TextStyle(
            fontSize: 9.48,
            color: Color(0xffA5A5A5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
