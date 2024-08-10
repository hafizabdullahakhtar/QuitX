import 'package:beinghuman/features/OnBoarding/OnBoardingWidgets/onboarding_page.dart';
import 'package:beinghuman/features/OnBoarding/OnBoardingWidgets/onboarding_skip.dart';
import 'package:beinghuman/features/OnBoarding/onboarding_controller.dart';
import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:beinghuman/utils/constants/text_strings.dart';
import 'package:beinghuman/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // PageView with OnBoardingPages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage_1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
                color: '9BB168',
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage_2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
                color: 'ED7E1C',
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage_3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
                color: 'BBB9B3',
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage_4,
                title: TTexts.onBoardingTitle4,
                subtitle: TTexts.onBoardingSubTitle4,
                color: '3E697C',
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage_5,
                title: TTexts.onBoardingTitle5,
                subtitle: TTexts.onBoardingSubTitle5,
                color: 'FFCE5C',
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage_6,
                title: TTexts.onBoardingTitle6,
                subtitle: TTexts.onBoardingSubTitle6,
                color: 'C2B1FF',
              ),
            ],
          ),
          // Skip Button at Top Right
          const OnBoardingSkip(),
          // SmoothPageIndicator at Bottom Left
          const OnBoardingNavigation(),
          // next button
          const CircularButton(),
        ],
      ),
    );
  }
}

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace + 10),
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 6,
          effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.dark,
            dotHeight: 6,
            spacing: 3,
            dotWidth: 10,
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  const CircularButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace - 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? TColors.light : TColors.dark,
          ),
          onPressed: () => OnBoardingController.instance.nextPage(),
          child: Icon(
            Iconsax.arrow_right_3,
            color: dark ? TColors.dark : TColors.light,
          ),
        ),
      ),
    );
  }
}


// class AnimatedButton extends StatefulWidget {
//   const AnimatedButton({Key? key}) : super(key: key);

//   @override
//   _AnimatedButtonState createState() => _AnimatedButtonState();
// }

// class _AnimatedButtonState extends State<AnimatedButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool _isAnimated = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );

//     // Do not start the animation immediately
//     // Instead, schedule it after the widget is laid out
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       _controller.forward();
//     });

//     _animation = Tween<double>(begin: 50, end: 200).animate(_controller)
//       ..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);

//     return Align(
//       alignment: Alignment.bottomRight,
//       child: Padding(
//         padding: const EdgeInsets.all(TSizes.defaultSpace - 10),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(_animation.value / 2),
//             ),
//             backgroundColor: dark ? TColors.light : TColors.dark,
//           ),
//           onPressed: () => OnBoardingController.instance.nextPage(),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (_animation.value > 50)
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       color: dark ? TColors.dark : TColors.light,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               Icon(
//                 Iconsax.arrow_right_3,
//                 color: dark ? TColors.dark : TColors.light,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
