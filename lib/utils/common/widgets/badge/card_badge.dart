import 'package:flutter/material.dart';
import 'package:beinghuman/utils/constants/colors.dart';

class CardBadge extends StatelessWidget {
  final Widget child;
  final int points;

  const CardBadge({
    Key? key,
    required this.child,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: TColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            child: Center(
              child: Text(
                points.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black, // Adjust color as needed
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
