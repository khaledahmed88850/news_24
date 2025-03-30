import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_24/core/helpers/index_stack_provider.dart';
import 'package:news_24/core/services/dependency_injection.dart';
import 'package:news_24/features/authentication/data/repo/auth_repo.dart';
import 'package:news_24/features/authentication/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:news_24/features/authentication/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:news_24/features/authentication/presentation/view/sign_in_view.dart';
import 'package:news_24/features/authentication/presentation/view/sign_up_view.dart';
import 'package:news_24/features/home/presentation/view/main_view.dart';
import 'package:provider/provider.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create: (context) => SignInCubit(getIt<AuthRepo>()),
              child: const SignInView(),
            ),
      );
    case SignUpView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create: (context) => SignUpCubit(getIt<AuthRepo>()),
              child: const SignUpView(),
            ),
      );
    case MainView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => ChangeNotifierProvider(
              create: (context) => IndexStackProvider(),
              child: const MainView(),
            ),
      );
    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}
