import 'package:beinghuman/features/HomeScreen/homeWidgets/Old/Profile/profile_card_painter.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: Size.infinite,
          painter: ProfileCardPainter(color: Colors.green, avatarRadius: 50),
        ),
        // const Align(
        //   child: CircleAvatar(
        //     backgroundColor: Colors.black,
        //     radius: 50, // Make background transparent
        //     child: Icon(
        //       Iconsax.activity,
        //       color: Colors.green,
        //     ), // Adjust radius as needed
        //   ),
        // ),
      ],
    );
  }
}
