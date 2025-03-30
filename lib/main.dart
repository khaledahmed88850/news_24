import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_24/core/services/app_routes.dart';
import 'package:news_24/core/services/custom_bloc_observer.dart';
import 'package:news_24/core/services/dependency_injection.dart';
import 'package:news_24/features/home/presentation/view/home_view.dart';
import 'package:news_24/features/home/presentation/view/main_view.dart';
import 'package:news_24/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  Bloc.observer = CustomBlocObserver();
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
            initialRoute: MainView.routeName,
          ),
    );
  }
}
