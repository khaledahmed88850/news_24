import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_24/core/utils/assets.dart';
import 'package:news_24/core/utils/text_styles.dart';
import 'package:news_24/features/authentication/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';

class GoogleLoginWidget extends StatelessWidget {
  const GoogleLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: const Color(0xFFE5DFE6),
        maximumSize: Size(200.w, 60.h),
      ),
      onPressed: () {
        context.read<SignInCubit>().signInWithGoogle();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
            child: Image.asset(Assets.assetsImagesGoogleIcon, fit: BoxFit.fill),
          ),
          const SizedBox(width: 12),
          Text(
            'Sign in with Google',
            style: Styles.medium14.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
