import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/WeeklyChallange/weekly_challange_model.dart';

List<WeeklyChallenge> weeklyChallenges = [
  WeeklyChallenge(
    iconPath: TImages.deleteaccounts,
    title: 'Purge Accounts',
    action1: 'Delete Adult Sites',
    action2: 'Delete Hookup Apps',
    action3: 'Unfollow Sexual Social Media',
    iconColor: const Color(0XFFFFD5D5),
  ),
  WeeklyChallenge(
    iconPath: TImages.cleandevice,
    title: 'Clean Devices',
    action1: 'Delete Files',
    action2: 'Clear History',
    action3: 'Remove Saved Links',
    iconColor: const Color(0XFFECFFA1),
  ),
  WeeklyChallenge(
    iconPath: TImages.screenrules,
    title: 'Screen Rules',
    action1: 'Limit Screen Time',
    action2: 'Device-Free Zones',
    action3: 'Device-Free Time',
    iconColor: const Color(0XFFFFF6A1),
  ),
  WeeklyChallenge(
    iconPath: TImages.expandinterests,
    title: 'Expand Interests',
    action1: 'Creativity',
    action2: 'Outdoor Activities',
    action3: 'Sports and Fitness',
    iconColor: const Color(0XFFC3C9FF),
  ),
];
