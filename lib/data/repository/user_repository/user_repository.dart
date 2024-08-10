import 'package:beinghuman/data/repository/repositories.authentication/authentication_repository.dart';
import 'package:beinghuman/features/Authentication/Model/UserModel/local_storage_manager.dart';
import 'package:beinghuman/features/Authentication/Model/UserModel/user_model.dart';
import 'package:beinghuman/utils/exceptions/firebase_exceptions.dart';
import 'package:beinghuman/utils/exceptions/format_exceptions.dart';
import 'package:beinghuman/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      print('Check USER IS THIS: ${user.email}');
      await _db.collection("Users").doc(user.userId).set(user.toJson());
      // Save authentication user data in Firestore
      await LocalStorageManager.saveUser(user);
      print('Check! USER: ${user.userId}');
      print('Check! in repo and Save done!');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong in REPO. Please try again';
    }
  }

  /// Function to fetch user details based on user ID.
  Future<UserModel?> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      // Save authentication user data in Firestore
      if (documentSnapshot.exists) {
        final UserModel user = UserModel.fromSnapshot(documentSnapshot);
        await LocalStorageManager.saveUser(
            user); // Save user data to local storage
        return user;
      } else {
        return null; // Indicate user not found
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update userdata in Firestore.
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.userId)
          .set(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update any field in specific User Collection.
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
