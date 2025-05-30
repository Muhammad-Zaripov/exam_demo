import 'package:flutter/material.dart';
import '../extensions/screen_size.dart';
import '../utils/app_colors.dart';

class Line extends StatelessWidget {
  const Line({super.key});
  @override
  Widget build(BuildContext context) {
    final double h = ScreenSize.heightFactor(context);
    return Container(
      width: double.infinity,
      height: 1 * h,
      color: AppColors.lineDarkColor,
    );
  }
}
