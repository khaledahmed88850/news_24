import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_24/core/services/dependency_injection.dart';
import 'package:news_24/features/home/data/repo/home_repo.dart';
import 'package:news_24/features/home/presentation/cubit/news_cubit.dart';
import 'package:news_24/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create:
            (context) => NewsCubit(getIt<HomeRepo>())..getNews(category: ''),
        child: const HomeViewBody(),
      ),
    );
  }
}
