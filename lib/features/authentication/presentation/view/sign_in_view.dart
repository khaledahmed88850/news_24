import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_24/features/authentication/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:news_24/features/authentication/presentation/view/widgets/sign_in_view_body.dart';
import 'package:news_24/features/home/presentation/view/main_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/sign-in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                Navigator.pushReplacementNamed(context, MainView.routeName);
              } else if (state is SignInFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black54,
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is SignInLoading ? true : false,
                child: const SignInViewBody(),
              );
            },
          ),
        ),
      ),
    );
  }
}
