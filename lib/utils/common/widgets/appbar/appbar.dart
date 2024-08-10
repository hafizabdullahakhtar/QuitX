import 'package:beinghuman/utils/common/widgets/custom_shapes/TPrimary_header.dart';
import 'package:beinghuman/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    Key? key,
    required this.name,
    required this.levelString,
    required this.points,
    required this.levelIcon,
    required this.pointsIcon,
    required this.avatarIcon,
  }) : super(key: key);

  final Widget name;
  final String levelString;
  final String levelIcon;
  final int points;
  final String pointsIcon;
  final String avatarIcon;

  @override
  Widget build(BuildContext context) {
    return TPrimaryHeaderContainer(
      child: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

// AppBar(
//       automaticallyImplyLeading: false,
//       title: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: Row(
//           children: [
//             Icon(
//               avatarIcon,
//               size: 40.0,
//             ),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(name),
//                 const SizedBox(height: 4),
//                 Text(levelString),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Image.asset(levelIcon),
//                     const SizedBox(width: 8),
//                     Text('Level: $levelString'),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Image.asset(pointsIcon),
//                     const SizedBox(width: 8),
//                     Text('Points: $points'),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
