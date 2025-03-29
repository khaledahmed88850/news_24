import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/sign-in';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Sign In View',
          style: TextStyle(fontFamily: 'SF Pro Display', color: Colors.black),
        ),
      ),
    );
  }
}
