import 'package:flutter/material.dart';
import 'package:news_24/features/authentication/presentation/view/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/sign-in';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: SignInViewBody()));
  }
}
