// import 'package:beinghuman/features/home%20screen/homeWidgets/small_cards.dart';
// import 'package:beinghuman/utils/common/widgets/badge/card_badge.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class HomeCardsCrousal extends StatelessWidget {
//   const HomeCardsCrousal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Carousel Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: CarouselSlider(
//           options: CarouselOptions(
//             height: 200.0,
//             aspectRatio: 16 / 9,
//             viewportFraction: 0.8,
//             initialPage: 0,
//             enableInfiniteScroll: true,
//             reverse: false,
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 3),
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enlargeCenterPage: true,
//             scrollDirection: Axis.horizontal,
//           ),
//           items: const [
//             CardBadge(points: 1, child: SmallCard()),
//             CardBadge(points: 1, child: SmallCard()),
//             CardBadge(points: 1, child: SmallCard()),
//             CardBadge(points: 1, child: SmallCard()),
//           ],
//         ),
//       ),
//     );
//   }
// }
