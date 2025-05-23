import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_24/core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, this.onItemTapped, required this.index});
  final ValueChanged<int>? onItemTapped;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: BottomNavigationBar(
        selectedItemColor: AppColors.kPrimaryColor,
        currentIndex: index,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        ],
      ),
    );
  }
}
