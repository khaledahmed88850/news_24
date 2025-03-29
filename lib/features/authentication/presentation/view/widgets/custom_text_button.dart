import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_24/core/utils/app_colors.dart';
import 'package:news_24/core/utils/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(150.w, 45.h),
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: onPressed,
      child: Text(text, style: Styles.medium14.copyWith(color: Colors.white)),
    );
  }
}
