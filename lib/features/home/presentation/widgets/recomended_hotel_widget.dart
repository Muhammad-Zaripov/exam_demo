import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/line_widget.dart';
import '../../../../core/models/hotel_model.dart';

class RecomendedHotelWidget extends StatelessWidget {
  final HotelModel hotel;

  const RecomendedHotelWidget({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final double h = ScreenSize.heightFactor(context);
    final double w = ScreenSize.widthFactor(context);
    return Container(
      width: 240 * w,
      height: 214 * h,
      decoration: BoxDecoration(
        color: AppColors.recomendedHotelColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                height: 100 * h,
                child: Stack(
                  children: [
                    Image.network(
                      hotel.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 100 * h,
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0x33151B33),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$${hotel.price.toString()}',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/Night',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      // ignore: deprecated_member_use
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hotel.location,
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
                SizedBox(height: 10 * h),
                Line(),
                SizedBox(height: 10 * h),
                Row(
                  spacing: 9,
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        SvgPicture.asset(AppImages.bed),
                        Text(
                          '${hotel.bedCount} Beds',
                          style: GoogleFonts.dmSans(
                            color: AppColors.textFieldDarkIconsColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: AppColors.textFieldDarkIconsColor,
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        SvgPicture.asset(AppImages.wifi),
                        hotel.wifi == true
                            ? Text(
                              'Wifi',
                              style: GoogleFonts.dmSans(
                                color: AppColors.textFieldDarkIconsColor,
                                fontSize: 12,
                              ),
                            )
                            : Text(
                              'No',
                              style: GoogleFonts.dmSans(
                                color: AppColors.textFieldDarkIconsColor,
                                fontSize: 12,
                              ),
                            ),
                      ],
                    ),
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: AppColors.textFieldDarkIconsColor,
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        SvgPicture.asset(AppImages.gym),
                        hotel.gym == true
                            ? Text(
                              'Gym',
                              style: GoogleFonts.dmSans(
                                color: AppColors.textFieldDarkIconsColor,
                                fontSize: 12,
                              ),
                            )
                            : Text(
                              'No',
                              style: GoogleFonts.dmSans(
                                color: AppColors.textFieldDarkIconsColor,
                                fontSize: 12,
                              ),
                            ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
