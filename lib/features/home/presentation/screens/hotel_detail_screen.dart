import 'dart:ui';

import 'package:exam_4_oy_demo/core/utils/app_images.dart';
import 'package:exam_4_oy_demo/features/home/presentation/widgets/see_all_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/add_review_widget.dart';
import '../widgets/yandex_map_widget.dart';
import 'select_date_screen.dart';

class HotelDetailScreen extends StatelessWidget {
  final HotelModel hotel;
  const HotelDetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(hotel.image, height: 360, fit: BoxFit.cover),
                Positioned(
                  top: 50,
                  left: 24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x33151B33),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            AppImages.arrowBack,
                            width: 24,
                            height: 24,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x33151B33),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            AppImages.share,
                            width: 24,
                            height: 24,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x33151B33),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            AppImages.heart,
                            width: 24,
                            height: 24,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: GoogleFonts.dmSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6 * h),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.location),
                      SizedBox(width: 6 * w),
                      Text(
                        hotel.location,
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          color: AppColors.textFieldDarkIconsColor,
                        ),
                      ),
                      SizedBox(width: 16 * w),
                      SvgPicture.asset(AppImages.star),
                      SizedBox(width: 4 * w),
                      Text(
                        hotel.rating.toString(),
                        style: GoogleFonts.dmSans(fontSize: 14),
                      ),
                      Text(
                        '  (${hotel.reviews?.length ?? 0} Reviews)',
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          color: AppColors.textFieldDarkIconsColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10 * h),
                  Row(
                    spacing: 6,
                    children: [
                      Text(
                        '\$${hotel.price}',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlueColor,
                        ),
                      ),
                      Text(
                        'Per Night',
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          color: AppColors.textFieldDarkIconsColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16 * h),
                  Text(
                    hotel.about,
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: AppColors.textFieldDarkIconsColor,
                    ),
                  ),
                  SizedBox(height: 10 * h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        spacing: 4,
                        children: [
                          SvgPicture.asset(
                            AppImages.wifi,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            'Wifi',
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: AppColors.textFieldDarkIconsColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 4,
                        children: [
                          SvgPicture.asset(
                            AppImages.shower,
                            width: 24,
                            height: 24,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                          Text(
                            'Shower',
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: AppColors.textFieldDarkIconsColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 4,
                        children: [
                          SvgPicture.asset(
                            AppImages.breakfast,
                            width: 24,
                            height: 24,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                          Text(
                            'Breakfast',
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: AppColors.textFieldDarkIconsColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 4,
                        children: [
                          SvgPicture.asset(
                            AppImages.gym,
                            width: 24,
                            height: 24,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                          Text(
                            'Gym',
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: AppColors.textFieldDarkIconsColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 17 * h),
                  SeeAllButton(title: "Location", seeAllText: "View Detail"),
                  SizedBox(height: 20 * h),
                  YandexMapWidget(hotel: hotel),
                  SizedBox(height: 30 * h),
                  SeeAllButton(title: "Reviews"),
                  SizedBox(height: 20 * h),
                  // BlocBuilder<ReviewsCubit, ReviewsState>(
                  //   builder: (context, state) {
                  //     if (state is ReviewsLoading) {
                  //       return const Center(child: CircularProgressIndicator());
                  //     }
                  //     return const SizedBox.shrink();
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 28, top: 18),
        color: AppColors.appBarButtonColor,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return AddReviewWidget(hotelId: hotel.id);
                    },
                  );
                },
                child: Container(
                  width: 54 * w,
                  height: 54 * h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(AppImages.addReviews),
                ),
              ),
            ),
            SizedBox(width: 15 * w),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectDateScreen(hotel: hotel),
                  ),
                );
              },
              child: Container(
                width: 258 * w,
                height: 54 * h,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Book Now',
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
