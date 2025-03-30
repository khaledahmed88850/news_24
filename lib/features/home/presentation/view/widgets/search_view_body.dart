import 'package:flutter/material.dart';
import 'package:news_24/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:news_24/features/home/presentation/view/widgets/news_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 25)),
          SliverToBoxAdapter(child: CustomSearchTextField()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),

          NewsListView(),
        ],
      ),
    );
  }
}
