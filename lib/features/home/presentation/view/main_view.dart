import 'package:flutter/material.dart';
import 'package:news_24/core/helpers/custom_pop_scope.dart';
import 'package:news_24/core/helpers/index_stack_provider.dart';
import 'package:news_24/core/widgets/custom_bottom_nav_bar.dart';
import 'package:news_24/features/home/presentation/view/home_view.dart';
import 'package:news_24/features/home/presentation/view/search_view.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = '/main view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    var indexedStack = Provider.of<IndexStackProvider>(context);

    return CustomPopScope(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          index: indexedStack.currentIndex,
          onItemTapped: (value) {
            indexedStack.setIndex(value);
          },
        ),
        body: SafeArea(
          child: IndexedStack(
            index: indexedStack.currentIndex,
            children: screens,
          ),
        ),
      ),
    );
  }

  List<Widget> screens = [const HomeView(), const SearchView()];
}
