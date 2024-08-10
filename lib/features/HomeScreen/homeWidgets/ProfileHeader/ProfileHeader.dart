import "package:beinghuman/features/HomeScreen/homeWidgets/ProfileHeader/AccountInfo.dart";
import "package:beinghuman/utils/constants/image_strings.dart";
import "package:beinghuman/utils/constants/sizes.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.of(context).size.width * .9,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 136, 211, 254), // Start color
                    Color(0xFFFFC5FF), // End color
                  ],
                ),
                // image: const DecorationImage(
                //     image: AssetImage(
                //       TImages.gradient,
                //     ),
                //     fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.white),
              ),
              // name & account plan
              child: Column(
                children: [
                  const SizedBox(height: 50), // Adjusted height for AppBar
                  // name
                  Text(
                    'SoberSeeker',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 5),

                  // account type
                  Text(
                    'Starter Plan',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // account info
                  const AccountInfo()
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                TImages.tempAvatar,
                width: 50,
                height: 50,
              ),
            ),
            Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: Container(
                width: 95.0,
                height: 95.0,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(
                      TImages.profilePic,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
