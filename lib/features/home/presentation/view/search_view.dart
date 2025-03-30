import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_24/core/services/dependency_injection.dart';
import 'package:news_24/features/home/data/repo/home_repo.dart';
import 'package:news_24/features/home/presentation/cubit/news_cubit.dart';
import 'package:news_24/features/home/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(getIt<HomeRepo>()),
      child: const SearchViewBody(),
    );
  }
}
