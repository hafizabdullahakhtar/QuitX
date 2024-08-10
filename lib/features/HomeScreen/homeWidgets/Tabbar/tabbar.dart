// import 'package:beinghuman/features/HomeScreen/homeWidgets/TrackOverview.dart/TrackOverview.dart';
// import 'package:beinghuman/utils/constants/colors.dart';
// import 'package:beinghuman/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';

// class MyTabBar extends StatefulWidget {
//   const MyTabBar({super.key});

//   @override
//   State<MyTabBar> createState() => _MyTabBarState();
// }

// class _MyTabBarState extends State<MyTabBar> {
//   List<String> items = [
//     "XXX",
//     "Smoking",
//     "Substance",
//     "Social Media",
//     "OCD",
//   ];

//   int current = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       width: double.infinity,
//       // height: double.,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 60,
//             width: double.infinity,
//             child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: items.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (ctx, index) {
//                   return Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             current = index;
//                           });
//                         },
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 150),
//                           margin: const EdgeInsets.all(5),
//                           width: 110,
//                           height: 45,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: current == index
//                                   ? const Color(0XFF222222)
//                                   : Colors.white),
//                           child: Center(
//                             child: Text(
//                               items[index],
//                               style: TextStyle(
//                                 color: current == index
//                                     ? Colors.white
//                                     : const Color(0XFF222222),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Visibility(
//                         visible: current == index,
//                         child: Container(
//                           width: 5,
//                           height: 5,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: TColors.black,
//                           ),
//                         ),
//                       )
//                     ],
//                   );
//                 }),
//           ),

//           /// MAIN BODY
//           const SizedBox(height: TSizes.spaceBtwItems),
//           // const TrackOverview(),
//         ],
//       ),
//     );
//   }
// }
