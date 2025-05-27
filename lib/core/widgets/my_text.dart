import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class MyText extends StatefulWidget {
  final String title1;
  final String title2;
  const MyText({super.key, required this.title1, required this.title2});

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title1,
          style: GoogleFonts.dmSans(
            color: AppColors.primaryBlueColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          widget.title2,
          textAlign: TextAlign.center,
          style: GoogleFonts.dmSans(
            color: AppColors.lightWhiteTextColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
