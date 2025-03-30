import 'package:flutter/material.dart';
import 'package:news_24/core/utils/text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMesage});
  final String errMesage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMesage, style: Styles.bold18));
  }
}
