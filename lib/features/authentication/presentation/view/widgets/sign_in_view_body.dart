import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_24/core/utils/assets.dart';
import 'package:news_24/core/utils/text_styles.dart';
import 'package:news_24/features/authentication/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:news_24/features/authentication/presentation/view/sign_up_view.dart';
import 'package:news_24/features/authentication/presentation/view/widgets/custom_text_button.dart';
import 'package:news_24/features/authentication/presentation/view/widgets/custom_text_form_field.dart';

import '../../../data/models/user_model.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  String? mail, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SvgPicture.asset(Assets.assetsImagesAppLogo),
              const SizedBox(height: 12),
              Text(
                'News 24',
                style: Styles.bold18.copyWith(
                  shadows: [
                    Shadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      color: const Color(0xFF000000).withValues(alpha: 0.2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextFormField(
                hintText: 'Email',
                onSaved: (value) {
                  mail = value;
                },
              ),
              SizedBox(height: 30.h),
              CustomTextFormField(
                obscureText: true,
                hintText: 'Password',
                onSaved: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 80.h),
              CustomTextButton(
                text: 'Sign In',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    UserModel userModel = UserModel(
                      email: mail!,
                      uId: password!,
                    );
                    context.read<SignInCubit>().signIn(userModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              SizedBox(height: 20.h),
              const Divider(thickness: 1.5),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  backgroundColor: const Color(0xFFE5DFE6),
                  maximumSize: Size(200.w, 60.h),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30.w,
                      child: Image.asset(
                        Assets.assetsImagesGoogleIcon,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Sign in with Google',
                      style: Styles.medium14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? ', style: Styles.medium13),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(SignUpView.routeName);
                    },
                    child: Text(
                      'Register',
                      style: Styles.bold13.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
