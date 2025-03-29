import 'package:flutter/material.dart';
import 'package:news_24/features/authentication/presentation/view/sign_in_view.dart';
import 'package:news_24/features/authentication/presentation/view/sign_up_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInView.routeName:
      return MaterialPageRoute(builder: (_) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}
