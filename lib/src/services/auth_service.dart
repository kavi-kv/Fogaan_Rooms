import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fogaan_rooms/src/features/views/auth_widgets/login_page.dart';
import 'package:fogaan_rooms/src/features/views/home/Home.dart';
import 'package:get/get.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Empty Fields!',
        "Please enter your email and password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar(
        '',
        "Account successfully created",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.off(() => const LoginScreen());
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        // log('The password you provided is weak');
        Get.snackbar(
          'Weak Password',
          "The password you provided is weak",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for the email you provided');
        Get.snackbar(
          'Email already exists',
          "The email provided already exists",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          borderRadius: 10,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Unknown Error',
        "$error",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Empty Fields!',
        "Please enter your email and password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
      return;
    }
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.off(() => const Home());
    } on FirebaseException catch (error) {
      if (error.code == 'user-not-found') {
        Get.snackbar(
          'Not Found!',
          "No user found for that email!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
        );
      } else if (error.code == 'wrong-password') {
        Get.snackbar(
          'Wrong Cridential',
          "Wrong password is provided",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch(e) {
      Get.snackbar(
        'Unknown Error',
        "Error is :$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
