import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_24/core/utils/dummy_news.dart';
import 'package:news_24/core/widgets/custom_error_widget.dart';
import 'package:news_24/features/home/presentation/cubit/news_cubit.dart';
import 'package:news_24/features/home/presentation/view/widgets/news_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsSuccess) {
          return SliverList.builder(
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: NewsWidget(newsModel: state.newsList[index]),
              );
            },
          );
        } else if (state is NewsFailure) {
          return SliverToBoxAdapter(
            child: Center(child: CustomErrorWidget(errMesage: state.message)),
          );
        } else if (state is NewsLoading) {
          return Skeletonizer.sliver(
            child: SliverList.builder(
              itemCount: dummyNewsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: NewsWidget(newsModel: dummyNewsList[index]),
                );
              },
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
