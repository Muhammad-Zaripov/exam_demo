import 'package:exam_4_oy_demo/core/extensions/screen_size.dart';
import 'package:exam_4_oy_demo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContanerWidget extends StatefulWidget {
  final String transaction;
  final String review;
  final String bookings;
  final String transaction2;
  final String review2;
  final String bookings2;

  const MyContanerWidget({
    super.key,
    required this.bookings,
    required this.bookings2,
    required this.review,
    required this.review2,
    required this.transaction,
    required this.transaction2,
  });

  @override
  State<MyContanerWidget> createState() => _MyContanerWidgetState();
}

class _MyContanerWidgetState extends State<MyContanerWidget> {
  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);

    return Container(
      width: 330 * w,
      height: 90 * w,
      decoration: BoxDecoration(
        color: AppColors.recomendedHotelColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 45.0,
          right: 45,
          top: 15,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.transaction,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.primaryBlueColor,
                  ),
                ),
                SizedBox(height: 5 * w),
                Text(
                  widget.transaction2,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.review,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.primaryBlueColor,
                  ),
                ),
                SizedBox(height: 5 * w),
                Text(
                  widget.review2,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.bookings,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.primaryBlueColor,
                  ),
                ),
                SizedBox(height: 5 * w),
                Text(
                  widget.bookings2,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
