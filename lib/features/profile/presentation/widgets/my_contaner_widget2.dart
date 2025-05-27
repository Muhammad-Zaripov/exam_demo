import 'package:exam_4_oy_demo/core/utils/app_colors.dart';
import 'package:exam_4_oy_demo/core/utils/app_images.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/widgets/my_contaner_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';

class MyWidget2 extends StatefulWidget {
  final String price;
  final String totalPrinceText;
  final String hotelName;
  final String data;
  final String hotelInfo;
  // ignore: prefer_typing_uninitialized_variables
  final image;
  final String hotelStatus;
  // ignore: prefer_typing_uninitialized_variables
  final containerColor;

  const MyWidget2({
    super.key,
    required this.data,
    required this.hotelInfo,
    required this.hotelName,
    required this.hotelStatus,
    required this.image,
    required this.price,
    required this.totalPrinceText,
    required this.containerColor,
  });

  @override
  State<MyWidget2> createState() => _MyWidget2State();
}

class _MyWidget2State extends State<MyWidget2> {
  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.widthFactor(context);
    return Container(
      width: 330 * w,
      height: 200 * w,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.data,
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
                MyContanerButton(
                  // ignore: deprecated_member_use
                  color: AppColors.lightOrangeColor.withOpacity(0.5),
                  height: 39 * w,
                  title: widget.hotelStatus,
                  width: 80 * w,
                  textColor: AppColors.orangeTextColor,
                ),
              ],
            ),
            SizedBox(height: 20 * w),
            Row(
              spacing: 15,
              children: [
                Container(
                  width: 65 * w,
                  height: 65 * w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(AppImages.image, fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.hotelName,
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.hotelInfo,
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15 * w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.totalPrinceText,
                      style: GoogleFonts.dmSans(
                        color: AppColors.textFieldDarkIconsColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5 * w),
                    Text(
                      widget.price,
                      style: GoogleFonts.dmSans(
                        color: AppColors.primaryBlueColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                MyContanerButton(
                  color: AppColors.primaryBlueColor,
                  height: 35 * w,
                  title: "Check In",
                  width: 120 * w,
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
