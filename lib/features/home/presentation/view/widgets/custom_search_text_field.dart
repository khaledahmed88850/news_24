import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_24/features/home/presentation/cubit/news_cubit.dart';
import 'package:provider/provider.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        context.read<NewsCubit>().getNewsBySearch(query: value);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search_sharp, size: 20),
        suffixIcon: IconButton(
          onPressed: () {
            controller.clear();
          },
          icon: Container(
            height: 20.h,
            width: 20.w,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: const BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: const Icon(Icons.close, size: 16, color: Colors.grey),
          ),
        ),
        fillColor: const Color(0xffEEEEEE),

        hintText: 'Search',
      ),
    );
  }
}
