import 'package:flutter/material.dart';
import 'package:news_24/features/authentication/presentation/view/sign_in_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInView.routeName:
      return MaterialPageRoute(builder: (_) => SignInView());
    default:
      return MaterialPageRoute(builder: (_) => Placeholder());
  }
}
