import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_24/core/errors/exceptions.dart';

class AuthServices {
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log(e.code.toString());
        throw Customexception(message: 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        log(e.code.toString());
        throw Customexception(message: 'The account already exists');
      } else if (e.code == ' network-request-failed') {
        log(e.code.toString());
        throw Customexception(message: 'No internet connection');
      } else {
        log(e.message.toString());
        throw Customexception(
          message: 'Something went wrong , try again later',
        );
      }
    } catch (e) {
      log(e.toString());
      throw Customexception(message: 'Something went wrong , try again later');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log(e.code.toString());
        throw Customexception(
          message: 'Email address is not registered. Please sign up.',
        );
      } else if (e.code == 'wrong-password') {
        log(e.code.toString());
        throw Customexception(
          message: 'email address or password is incorrect. Please try again.',
        );
      } else if (e.code == 'invalid-email') {
        log(e.code.toString());
        throw Customexception(
          message: 'email address is invalid. Please try again.',
        );
      } else if (e.code == ' network-request-failed') {
        log(e.code.toString());
        throw Customexception(message: 'No internet connection');
      } else {
        throw Customexception(
          message: 'Something went wrong , try again later',
        );
      }
    } catch (e) {
      log(e.toString());
      throw Customexception(message: 'Something went wrong , try again later');
    }
  }
}
