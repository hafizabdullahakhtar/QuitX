// // sound_service.dart
// import 'package:audioplayers/audioplayers.dart';

// class SoundService {
//   SoundService._();
//   static SoundService? _instance;
//   static SoundService get instance {
//     _instance ??= SoundService._();
//     return _instance!;
//   }

//   final AudioPlayer _player = AudioPlayer();

//   Future<void> loadSounds() async {
//     // No need to preload sounds with AudioPlayer
//   }

//   Future<void> playTapDownSound() async {
//     await _player.play(UrlSource('assets/sfx/DailyHabits.mp3'));
//   }
// }
