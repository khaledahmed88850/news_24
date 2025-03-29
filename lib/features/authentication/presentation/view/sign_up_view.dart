import 'package:flutter/material.dart';
import 'package:news_24/features/authentication/presentation/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: SignUpViewBody()));
  }
}
