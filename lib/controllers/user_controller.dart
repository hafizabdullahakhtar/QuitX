import 'dart:async';
import 'package:beinghuman/data/repository/user_repository/user_repository.dart';
import 'package:beinghuman/features/Authentication/Model/UserModel/user_model.dart';
import 'package:beinghuman/features/Authentication/Model/UserModel/user_rank_level_model.dart';
import 'package:beinghuman/utils/common/snackbar/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  var profileLoading = false.obs;

  Rx<UserModel> user = Rx<UserModel>(UserModel.empty());

  var secondsRemaining = 0.obs;

  late Timer? timer;

  late int currentRankIndex;
  late int currentLevelIndex;
  bool timerRunning = false;

  final userRepository = Get.put(UserRepository());

  var ranks = [
    Rank(rankName: "Rookie", levels: [
      Level(levelNumber: 1, daysToUpgrade: 1),
      Level(levelNumber: 2, daysToUpgrade: 3),
      Level(levelNumber: 3, daysToUpgrade: 7),
    ]),
    Rank(rankName: "Knight", levels: [
      Level(levelNumber: 1, daysToUpgrade: 10),
      Level(levelNumber: 2, daysToUpgrade: 20),
      Level(levelNumber: 3, daysToUpgrade: 30),
    ]),
    Rank(rankName: "Champion", levels: [
      Level(levelNumber: 1, daysToUpgrade: 50),
      Level(levelNumber: 2, daysToUpgrade: 60),
      Level(levelNumber: 3, daysToUpgrade: 100),
    ]),
    Rank(rankName: "Master", levels: [
      Level(levelNumber: 1, daysToUpgrade: 150),
      Level(levelNumber: 2, daysToUpgrade: 200),
      Level(levelNumber: 3, daysToUpgrade: 256),
    ]),
    Rank(rankName: "Legend", levels: [
      Level(levelNumber: 1, daysToUpgrade: 256),
    ]),
  ];

  @override
  void onInit() {
    currentRankIndex = 0;
    currentLevelIndex = 0;
    super.onInit();
    fetchUserRecord();
  }

  void fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');

        final user = UserModel(
          userId: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts[1] : "",
          email: userCredentials.user!.email ?? '',
          level: 1,
          rank: 'Beginner',
          diamondCount: 0,
          coinCount: 0,
        );

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      print('Error saving user record: $e');
      TSnackBars.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. Please try again.',
      );
    }
  }

  void rewardCoins(int amount) {
    user.update((val) {
      val!.coinCount += amount;
    });
  }

  void rewardDiamonds(int count) {
    user.update((val) {
      val!.diamondCount += count;
    });
  }

  int getTotalSecondsForCurrentLevel() {
    return ranks[currentRankIndex].levels[currentLevelIndex].daysToUpgrade *
        24 *
        3600;
  }

  void startTimer() {
    if (!timerRunning) {
      user.value.isOnStreak = true;
      timerRunning = true;
      print('Diamond rewarded!');
      rewardDiamonds(1);

      var secondsToUpgrade = getTotalSecondsForCurrentLevel();

      if (secondsRemaining.value > 0) {
        // Use existing timer logic if there's elapsed time
        timer = Timer.periodic(const Duration(microseconds: 1), (Timer t) {
          if (secondsRemaining.value == 0) {
            t.cancel();
            incrementLevel();
            rewardCoins(100);
            timerRunning = false;
          } else {
            secondsRemaining.value--;
          }
        });
      } else {
        // Reset timer if elapsed time is 0 or negative
        secondsRemaining.value = secondsToUpgrade;
        print('Starting timer from scratch.');
        timer = Timer.periodic(const Duration(microseconds: 1), (Timer t) {
          if (secondsRemaining.value == 0) {
            t.cancel();
            incrementLevel();
            rewardCoins(100);
            timerRunning = false;
          } else {
            secondsRemaining.value--;
          }
        });
      }
    }
    print('Coins: ${user.value.coinCount}');
    print('Diamonds: ${user.value.diamondCount}');
  }

  double percentage() {
    var secondsToUpgrade =
        ranks[currentRankIndex].levels[currentLevelIndex].daysToUpgrade *
            24 *
            3600;
    return secondsRemaining / secondsToUpgrade;
  }

  void incrementLevel() {
    // Check if there are more ranks available (avoid going out of bounds)
    if (currentRankIndex < ranks.length - 1) {
      // Check if current level is the last level within the current rank
      if (currentLevelIndex == ranks[currentRankIndex].levels.length - 1) {
        // Increment rank index (move to the next rank)
        currentRankIndex++;
        print('10 Coins for ranking up!');

        // Reset level in the user model
        user.value.level = 0;

        // Reset level index in the controller
        currentLevelIndex = 0;

        // Update user rank name in the model if there are more ranks
        if (currentRankIndex < ranks.length) {
          user.update((val) => val!.rank = ranks[currentRankIndex].rankName);
        }
      } else {
        // Simply increment the level index within the current rank
        currentLevelIndex++;

        // Update user level in the model (increment by 1)
        user.update((val) => val!.level++);
        print('5 Coins for leveling up!');
      }
    } else {
      // Reset rank index if all levels of the last rank are completed
      currentRankIndex = 0;
      print('All levels of the last rank are completed.');
    }

    // Update user level in the model again for consistency (might be redundant)
    // user.update((val) => val!.level++);
  }

  int getTotalDaysSpent() {
    var secondsToUpgrade = getTotalSecondsForCurrentLevel();
    print((secondsToUpgrade - secondsRemaining.value) ~/ (24 * 3600));
    return (secondsToUpgrade - secondsRemaining.value) ~/ (24 * 3600);
  }

  int getTotalDaysForCurrentLevel() {
    return ranks[currentRankIndex].levels[currentLevelIndex].daysToUpgrade;
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
