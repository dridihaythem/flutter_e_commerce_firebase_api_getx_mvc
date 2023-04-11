import 'package:e_commerce_firebase_getw/utils/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isPasswordVisible = false;

  bool isChecked = false;

  bool isLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn();

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleCheckbox() {
    isChecked = !isChecked;
    update();
  }

  Future<void> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    if (isLoading) {
      return;
    }

    if (!isChecked) {
      customSnackBar(
        type: 'error',
        title: 'Error',
        message: 'Please agree to the terms and conditions',
      );
      return;
    }
    isLoading = true;
    update();

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await auth.currentUser!.updateDisplayName(name);

      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }

      customSnackBar(
        type: 'error',
        title: 'Error',
        message: message,
      );
    } catch (e) {
      customSnackBar(
        type: 'error',
        title: 'Error',
        message: e.toString(),
      );
    }

    isLoading = false;
    update();
  }

  Future<void> logInWithEmailAndPasswod({
    required String email,
    required String password,
  }) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed('/home');
    } catch (e) {
      customSnackBar(
        type: 'error',
        title: 'Error',
        message: 'Invalid email or password',
      );
    }

    isLoading = false;
    update();
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();
    try {
      await auth.sendPasswordResetEmail(email: email);
      customSnackBar(
        type: 'success',
        title: 'Success',
        message: 'Password reset link sent to your email',
      );
    } catch (e) {
      customSnackBar(
        type: 'error',
        title: 'Error',
        message: 'Invalid email',
      );
    }

    isLoading = false;
    update();
  }

  void loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      Get.offNamed('/home');
    } catch (e) {
      customSnackBar(
        type: 'error',
        title: 'Error',
        message: e.toString(),
      );
    }
  }
}
