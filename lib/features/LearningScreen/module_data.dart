import 'package:beinghuman/features/LearningScreen/module_modal.dart';
import 'package:flutter/material.dart';

// Dummy data for learning modules
List<LearningModule> dummyModules = [
  LearningModule(
    id: '1',
    title: 'Understand Addiction',
    description:
        'Learn about the concept of addiction and its impact on individuals.',
    videoUrls: [
      'url1',
      'url2',
      'url3',
    ],
    color: Colors.blue, // Add color attribute
    icon: Icons.bookmark, // Add icon attribute
    progress: 0.2, // Add progress attribute (20% progress)
  ),
  LearningModule(
    id: '2',
    title: 'Recognizing Triggers',
    description:
        'Explore common triggers that may lead to addictive behaviors.',
    videoUrls: [
      'url4',
      'url5',
    ],
    color: Colors.green, // Add color attribute
    icon: Icons.warning, // Add icon attribute
    progress: 0.5, // Add progress attribute (50% progress)
  ),
  LearningModule(
    id: '3',
    title: 'Building Coping Skills',
    description:
        'Develop coping strategies to manage cravings and difficult emotions.',
    videoUrls: [
      'url6',
      'url7',
      'url8',
    ],
    color: Colors.orange, // Add color attribute
    icon: Icons.lightbulb, // Add icon attribute
    progress: 0.8, // Add progress attribute (80% progress)
  ),
  LearningModule(
    id: '4',
    title: 'Developing Healthy Habits',
    description: 'Establish healthy habits and routines to support recovery.',
    videoUrls: [
      'url9',
      'url10',
      'url11',
    ],
    color: Colors.red, // Add color attribute
    icon: Icons.favorite, // Add icon attribute
    progress: 0.4, // Add progress attribute (40% progress)
  ),
  LearningModule(
    id: '5',
    title: 'Maintaining Progress',
    description:
        'Learn strategies to prevent relapse and maintain long-term progress.',
    videoUrls: [
      'url12',
      'url13',
      'url14',
      'url15',
    ],
    color: Colors.purple, // Add color attribute
    icon: Icons.trending_up, // Add icon attribute
    progress: 0.6, // Add progress attribute (60% progress)
  ),
  LearningModule(
    id: '6',
    title: 'Islamic Perspectives',
    description:
        'Explore Islamic teachings and perspectives on addiction and recovery.',
    videoUrls: [
      'url16',
      'url17',
    ],
    color: Colors.deepOrange, // Add color attribute
    icon: Icons.star, // Add icon attribute
    progress: 0.3, // Add progress attribute (30% progress)
  ),
];
