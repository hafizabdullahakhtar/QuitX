import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'weekly_challange_data.dart';
import 'weekly_challange_icon.dart';

class WeeklyChallengeList extends StatelessWidget {
  const WeeklyChallengeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            'Weekly Challenges',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Container(
          height: 230, // Maintain the same height as the DailyHabitList
          padding: const EdgeInsets.only(left: 20),
          child: ListView.builder(
            // physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: weeklyChallenges.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: WeeklyChallengeIcon(
                  challengeData: weeklyChallenges[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
