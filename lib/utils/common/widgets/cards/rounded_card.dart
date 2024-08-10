import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TAddictionCard extends StatelessWidget {
  const TAddictionCard({
    Key? key,
    required this.svgImagePath,
    required this.addictionName,
    required this.addictionInfo,
    required this.addictionOverviewWidget,
    this.onDetailPressed,
  }) : super(key: key);

  final String svgImagePath;
  final String addictionName;
  final String addictionInfo;
  final Widget addictionOverviewWidget;
  final VoidCallback? onDetailPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      svgImagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addictionName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      addictionInfo,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: onDetailPressed,
                  child: Text(
                    'Detail',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                border: Border.all(color: TColors.lightGrey, width: 1.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Addiction Overview',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8.0),
                    addictionOverviewWidget,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
