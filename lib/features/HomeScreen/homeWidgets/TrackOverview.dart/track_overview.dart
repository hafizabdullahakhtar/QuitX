import 'package:beinghuman/features/HomeScreen/homeWidgets/TrackOverview.dart/stats_info.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/TrackOverview.dart/streak.dart';
import 'package:flutter/material.dart';

class TrackOverview extends StatelessWidget {
  const TrackOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0XFFFAFAFA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display user data using userModel
          Streak(),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              children: [
                // Display StatsInfoWidget
                StatsInfoWidget(),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 230, 197),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text('Video Lessons'),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 206, 255, 231),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text('Read Articles'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
