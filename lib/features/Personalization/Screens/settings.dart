import 'package:beinghuman/utils/common/widgets/custom_shapes/TPrimary_header.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: TSizes.appBarHeight,
                  color: Colors.blueAccent,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
