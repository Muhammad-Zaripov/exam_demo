import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../extensions/screen_size.dart';
import '../utils/app_colors.dart';

class MyIconWidget extends StatefulWidget {
  final VoidCallback onTap;
  // ignore: prefer_typing_uninitialized_variables
  final icon1;
  const MyIconWidget({super.key, required this.onTap, required this.icon1});

  @override
  State<MyIconWidget> createState() => MyIconWidgetState();
}

class MyIconWidgetState extends State<MyIconWidget> {
  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.widthFactor(context);
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        widget.onTap();
      },
      child: Ink(
        width: 44 * w,
        height: 44 * w,
        decoration: BoxDecoration(
          color: AppColors.recomendedHotelColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: SvgPicture.asset(widget.icon1)),
      ),
    );
  }
}
