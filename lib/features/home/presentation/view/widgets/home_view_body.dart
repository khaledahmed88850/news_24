import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_24/core/utils/assets.dart';
import 'package:news_24/core/utils/text_styles.dart';
import 'package:news_24/features/home/presentation/view/widgets/categories_list.dart';
import 'package:news_24/features/home/presentation/view/widgets/news_widget.dart';

import 'news_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: SvgPicture.asset(
                    Assets.assetsImagesAppLogo,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 12),
                Text('News 24', style: Styles.bold15),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40.h,
              width: double.infinity,
              child: const CategoriesList(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const NewsListView(),
        ],
      ),
    );
  }
}
