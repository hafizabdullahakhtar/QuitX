import 'package:beinghuman/features/HomeScreen/homeWidgets/DailyHabits/daily_habit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  static final AudioPlayer player = AudioPlayer();

  static Future<void> playSound({double volume = 5.0}) async {
    try {
      player.audioCache.prefix = 'lib/assets/sfx/';
      player.setPlayerMode(PlayerMode.mediaPlayer);
      await player.setVolume(volume);
      await player.play(AssetSource('DailyHabitsSmallest.mp3'),
          mode: PlayerMode.lowLatency);
    } catch (e) {
      print('Error playing sound: $e');
      // Handle error gracefully, e.g., show a snackbar
    }
  }
}

class DailyHabitIcon extends StatefulWidget {
  final HabitData habitData;

  const DailyHabitIcon({
    super.key,
    required this.habitData,
  });

  @override
  _DailyHabitIconState createState() => _DailyHabitIconState();
}

class _DailyHabitIconState extends State<DailyHabitIcon>
    with SingleTickerProviderStateMixin {
  late HabitData _habitData;
  late int _counter;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _habitData = widget.habitData;

    _counter = _habitData.counter!;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = _buildAnimation();
  }

  Animation<double> _buildAnimation() {
    return TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.0, end: 0.8),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.8, end: 1.1),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.1, end: 1.0),
        weight: 1,
      ),
    ]).animate(_controller);
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      SoundManager.playSound();
    }
    setState(() {
      _counter = _counter > 0 ? _counter - 1 : 0;
    });
    _controller.forward(from: 0.0);
  }

  void _showHabitDetailsModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Row for Icon and Name
              Row(
                children: [
                  SvgPicture.asset(
                    _habitData.iconPath,
                    colorFilter: ColorFilter.mode(
                      _habitData.iconColor,
                      BlendMode.srcIn,
                    ),
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _habitData.habitName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // 2. Progress Bar (Dummy Progress)
              LinearProgressIndicator(
                value: _habitData.counter! / 10, // Assuming max goal is 10
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 16),
              // 3. Text for "Notification"
              const Text(
                'Notification',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // 4. Notification Options (Morning, Noon, Evening)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNotificationButton('Morning'),
                  _buildNotificationButton('Noon'),
                  _buildNotificationButton('Evening'),
                ],
              ),
              const SizedBox(height: 16),
              // 5. Editable Daily Counter
              Row(
                children: [
                  const Text(
                    'Daily Goal: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Set goal',
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        // Handle the input change
                        // For example: update the goal value
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the modal
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationButton(String input) {
    bool isChecked = false; // Define the initial state of the checkbox

    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? newValue) {
            // Handle checkbox state change
            if (newValue != null) {
              isChecked = newValue;
              // Additional logic can be added here based on the newValue
            }
          },
        ),
        Text(
          input,
          style: const TextStyle(
              fontSize: 16), // Customize the text style as needed
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIconContainer() {
    return GestureDetector(
      onTap: () => _decreaseCounter(),
      onLongPress: () => _showHabitDetailsModal(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: const Color(0XFFF5F5F5),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.03),
                    offset: const Offset(0, 5),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                _habitData.iconPath,
                colorFilter: ColorFilter.mode(
                  _habitData.iconColor,
                  BlendMode.srcIn,
                ),
                width: 40,
                height: 40,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBadgeContainer() {
    if (_habitData.showBadge && _counter > 0) {
      // Conditionally render badge
      return Positioned(
        top: -10,
        right: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: const Color(0XFFF5F5F5),
            ),
          ),
          // Display the counter value
          child: Text(
            '$_counter',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            _buildIconContainer(),
            const SizedBox(height: 10),
            Text(_habitData.habitName),
          ],
        ),
        _buildBadgeContainer(),
      ],
    );
  }
}
