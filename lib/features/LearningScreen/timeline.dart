import 'package:beinghuman/features/LearningScreen/timeline_tile.dart';
import 'package:flutter/material.dart';

class LearningTimeLine extends StatelessWidget {
  const LearningTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20),
      children: const [
        //START
        MyTimelineTile(isFirst: true, isLast: false, isPast: true),

        //MIDDLE
        MyTimelineTile(isFirst: false, isLast: false, isPast: true),

        //END
        MyTimelineTile(isFirst: false, isLast: true, isPast: false),
      ],
    );
  }
}
