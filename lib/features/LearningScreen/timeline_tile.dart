import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;

  const MyTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,

        // decoration
        beforeLineStyle: LineStyle(
            color: isPast ? const Color(0XFF8278F9) : const Color(0XFFC0BBFF)),
        indicatorStyle: IndicatorStyle(
          width: 25,
          color: isPast ? const Color(0XFF8278F9) : const Color(0XFFC0BBFF),
          iconStyle: IconStyle(
              iconData: isPast ? Icons.done : Icons.add_circle,
              color: Colors.white),
        ),
        // learning module card
        endChild: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: isPast ? const Color(0XFF9990FF) : const Color(0XFFC0BBFF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "Text Widget For Now",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
