import 'package:beinghuman/features/HomeScreen/home_screen.dart';
import 'package:beinghuman/features/LearningScreen/learning_screen.dart';
import 'package:beinghuman/features/settings_screen/settings_screen.dart';
import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.teacher), label: 'Learn'),
            NavigationDestination(icon: Icon(Iconsax.chart), label: 'Progress'),
            NavigationDestination(
                icon: Icon(Iconsax.personalcard), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    // const HomeScreen(),
    const HomeScreen(),
    LearningScreen(),
    LearningScreen(),
    const SettingsScreen(),
  ];
}
