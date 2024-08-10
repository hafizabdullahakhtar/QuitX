import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/WeeklyChallange/weekly_challange_model.dart';
import 'package:iconsax/iconsax.dart';

class SoundManager {
  static final AudioPlayer player = AudioPlayer();

  static Future<void> playSound() async {
    try {
      player.audioCache.prefix = 'lib/assets/sfx/';
      player.setPlayerMode(PlayerMode.mediaPlayer);
      await player.play(AssetSource('weekly_challange_task.mp3'),
          mode: PlayerMode.lowLatency);
    } catch (e) {
      print('Error playing sound: $e');
      // Handle error gracefully, e.g., show a snackbar
    }
  }
}

class WeeklyChallengeIcon extends StatefulWidget {
  final WeeklyChallenge challengeData;

  const WeeklyChallengeIcon({
    super.key,
    required this.challengeData,
  });

  @override
  _WeeklyChallengeIconState createState() => _WeeklyChallengeIconState();
}

class _WeeklyChallengeIconState extends State<WeeklyChallengeIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.challengeData.progress == 0) {
            SoundManager.playSound();
            widget.challengeData.progress = 1;
            print('Challenge 1 completed for ${widget.challengeData.title}');
          } else if (widget.challengeData.progress == 1) {
            SoundManager.playSound();
            widget.challengeData.progress = 2;
            print('Challenge 2 completed for ${widget.challengeData.title}');
          } else if (widget.challengeData.progress == 2) {
            SoundManager.playSound();
            widget.challengeData.progress = 3;
            print('Challenge 3 completed for ${widget.challengeData.title}');
          }

          // Update UserModel data (example)

          print('CHALLANGE DATA: ${widget.challengeData}');
        });
      },
      child: Stack(
        children: [
          Container(
            width: 180,
            decoration: BoxDecoration(
              color: widget.challengeData.iconColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
                topRight: Radius.circular(90.0),
              ),
              border: Border.all(
                color: const Color(0XFFF5F5F5),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    widget.challengeData.iconPath,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.challengeData.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  buildActionRow(1, widget.challengeData),
                  const SizedBox(height: 4),
                  buildActionRow(2, widget.challengeData),
                  const SizedBox(height: 4),
                  buildActionRow(3, widget.challengeData),
                ],
              ),
            ),
          ),
          if (widget.challengeData.progress! > 0)
            Positioned(
              bottom: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (widget.challengeData.progress == 3) {
                          widget.challengeData.progress = 2;
                        } else if (widget.challengeData.progress == 2) {
                          widget.challengeData.progress = 1;
                        } else if (widget.challengeData.progress == 1) {
                          widget.challengeData.progress = 0;
                        }
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: const Icon(
                      Iconsax.undo,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildActionRow(int lineNumber, WeeklyChallenge data) {
    bool lineCompleted = data.progress! >= lineNumber;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Icon(
            lineCompleted ? Icons.check : Icons.radio_button_unchecked,
            size: 10,
            color: lineCompleted ? Colors.black : Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            lineNumber == 1
                ? data.action1
                : lineNumber == 2
                    ? data.action2
                    : data.action3,
          ),
        ),
      ],
    );
  }
}
