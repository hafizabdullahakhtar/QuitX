import 'package:beinghuman/controllers/network_manager.dart';
import 'package:beinghuman/data/repository/repositories.authentication/authentication_repository.dart';
import 'package:beinghuman/data/repository/user_repository/user_repository.dart';
import 'package:beinghuman/features/Authentication/Model/UserModel/user_model.dart';
import 'package:beinghuman/features/Authentication/Screens/SignupScreen/verify_email.dart';
import 'package:beinghuman/utils/common/snackbar/snackbars.dart';
import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:beinghuman/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SIGNUP
  signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.docerAnimation,
      );
      print('Check! processing information...');

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remov loader
        TFullScreenLoader.stopLoading();
        return;
      }
      print('Check! is connected.');

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // privacy policy
      if (!privacyPolicy.value) {
        TSnackBars.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use',
        );
        TFullScreenLoader.stopLoading();
        return;
      }

      // register user in firebase authentication & save user data in firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Create initial user progress
      // final UserProgress initialProgress = UserProgress(
      //   currentRank: ranks.first, // Initial rank (e.g., Rookie)
      //   currentLevelIndex: userProgress.currentLevelIndex,
      // );

      // Create initial user progress
      // final UserProgress initialProgress = UserProgress(
      //     currentRank: ranks.first, currentLevelIndex: 0, totalPoints: 0);

      // Create UserModel instance with nested userProgress
      final UserModel newUser = UserModel(
        userId: UserCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        level: 1,
        rank: 'Beginner',
        diamondCount: 0,
        coinCount: 0,
      );

      print('Check! created user');

      // Save authentication user data in Firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      print('Check! Repo Done!');

      // stop loading then show succes message
      TFullScreenLoader.stopLoading();

      // show success message
      TSnackBars.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

      // will create later
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();

      // show error snack bar to user
      TSnackBars.errorSnackBar(title: 'Oh Hoo!', message: e.toString());
    }
    // finally {
    //   TFullScreenLoader.stopLoading();
    // }
  }
}
