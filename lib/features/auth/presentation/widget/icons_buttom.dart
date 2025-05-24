import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class MyIconsButtom extends StatefulWidget {
  const MyIconsButtom({super.key});

  @override
  State<MyIconsButtom> createState() => _MyIconsButtomState();
}

class _MyIconsButtomState extends State<MyIconsButtom> {
  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);

    return Row(
      children: [
        Container(
          width: 150 * w,
          height: 50 * w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.googleIcon),
              SizedBox(width: 15),
              Text(
                "Google",
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: AppColors.lightBlackColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 25 * w),
        Container(
          width: 150 * w,
          height: 50 * w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.primaryBlueColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.facebookIcon),
              SizedBox(width: 15),
              Text(
                "Facebook",
                style: GoogleFonts.dmSans(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
