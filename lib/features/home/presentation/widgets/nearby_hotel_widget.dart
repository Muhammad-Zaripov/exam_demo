import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class NearbyHotelWidget extends StatelessWidget {
  final HotelModel hotel;
  const NearbyHotelWidget({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.recomendedHotelColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                hotel.image,
                width: 76,
                height: 76,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                SizedBox(height: 4 * h),
                Text(
                  hotel.location,
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
                SizedBox(height: 8 * h),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${hotel.price}',
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlueColor,
                            ),
                          ),
                          TextSpan(
                            text: '/ Night',
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textFieldDarkIconsColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20 * w),
                    SvgPicture.asset(AppImages.star),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: hotel.rating.toString(),
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '  (${hotel.reviews?.length ?? 0} Reviews)',
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textFieldDarkIconsColor,
                            ),
                          ),
                        ],
                      ),
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
