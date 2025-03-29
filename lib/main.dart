import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_24/core/services/app_routes.dart';
import 'package:news_24/features/authentication/presentation/view/sign_in_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'SF Pro Display'),
            onGenerateRoute: onGenerateRoute,
            initialRoute: SignInView.routeName,
          ),
    );
  }
}
