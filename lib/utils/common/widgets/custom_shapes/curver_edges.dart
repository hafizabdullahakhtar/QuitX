import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    final c1firstPoint = Offset(0, size.height - 20);
    final c1secondPoint = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        c1firstPoint.dx, c1firstPoint.dy, c1secondPoint.dx, c1secondPoint.dy);

    final c2firstPoint = Offset(0, size.height - 20);
    final c2secondPoint = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        c2firstPoint.dx, c2firstPoint.dy, c2secondPoint.dx, c2secondPoint.dy);

    final c3firstPoint = Offset(size.width, size.height - 20);
    final c3secondPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        c3firstPoint.dx, c3firstPoint.dy, c3secondPoint.dx, c3secondPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}






// import 'package:flutter/material.dart';

// class TCustomCurvedEdges extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();

//     // Move to the starting point at the top-left
//     path.moveTo(0, 0);

//     // Draw a line to the top-right
//     path.lineTo(size.width, 0);

//     // Draw a line to the bottom-right, leaving bottom-right corner for radius
//     path.lineTo(size.width, size.height - 30);

//     // Define the control points for the bottom-right curve
//     final c1firstPoint = Offset(0, size.height);
//     final c1secondPoint = Offset(size.width, size.height - 20);
//     // Draw the curve to the bottom-right corner
//     path.quadraticBezierTo(
//       c1secondPoint.dx,
//       c1firstPoint.dy,
//       size.width - 30,
//       size.height,
//     );

//     // Draw a line to the bottom-left corner
//     path.lineTo(30, size.height);

//     // Define the control points for the bottom-left curve
//     final c2firstPoint = Offset(30, size.height);
//     final c2secondPoint = Offset(0, size.height - 20);
//     // Draw the curve to the bottom-left corner
//     path.quadraticBezierTo(
//       c2secondPoint.dx,
//       c2firstPoint.dy,
//       0,
//       size.height - 30,
//     );

//     // Draw a line to close the path
//     path.lineTo(0, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
