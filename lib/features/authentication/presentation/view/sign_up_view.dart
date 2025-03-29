import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_24/features/authentication/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:news_24/features/authentication/presentation/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.lightGreen,
                  content: Text('Sign Up Success'),
                ),
              );
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignUpLoading ? true : false,
              child: const SignUpViewBody(),
            );
          },
        ),
      ),
    );
  }
}
