import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_24/core/utils/app_colors.dart';
import 'package:news_24/core/utils/text_styles.dart';
import 'package:news_24/features/home/presentation/cubit/news_cubit.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor:
                  index == selectedIndex
                      ? AppColors.kPrimaryColor
                      : const Color(0xFFEEEEEE),
            ),
            onPressed: () {
              setState(() {
                if (selectedIndex == index) {
                  return;
                } else {
                  context.read<NewsCubit>().getNews(
                    category: categories[index],
                  );
                  selectedIndex = index;
                }
              });
            },
            child: Text(
              categories[index],
              style: Styles.medium14.copyWith(
                color:
                    index == selectedIndex
                        ? Colors.white
                        : const Color(0xFF909090),
              ),
            ),
          ),
        );
      },
    );
  }

  List<String> categories = [
    'General',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];
}
