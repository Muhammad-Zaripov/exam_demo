import 'package:exam_4_oy_demo/core/widgets/line_widget.dart';
import 'package:exam_4_oy_demo/features/home/presentation/widgets/nearby_hotel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/checkout_detail_widget.dart';

class ChekoutScreen extends StatelessWidget {
  final HotelModel hotel;
  const ChekoutScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 68 * w,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: AppColors.appBarButtonColor,
                borderRadius: BorderRadius.circular(30),
              ),
              width: 44 * w,
              height: 44 * h,
              child: SvgPicture.asset(
                AppImages.arrowBack,
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: AppColors.appBarButtonColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 44 * w,
                height: 44 * h,
                child: SvgPicture.asset(
                  AppImages.setting,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Checkout',
          style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NearbyHotelWidget(hotel: hotel),
            SizedBox(height: 20 * h),
            Text(
              'Dates',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10 * h),
            CheckoutDetailWidget(
              title: '17 - 20 April 2022',
              icon: SvgPicture.asset(AppImages.calendar),
            ),
            SizedBox(height: 20 * h),
            Text(
              'Guests',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10 * h),
            CheckoutDetailWidget(
              title: '2 Guests (1 Room)',
              icon: SvgPicture.asset(
                AppImages.user,
                // ignore: deprecated_member_use
                color: AppColors.primaryBlueColor,
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(height: 20 * h),
            Text(
              'Promo',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10 * h),
            CheckoutDetailWidget(
              title: '1 Promo Used',
              icon: SvgPicture.asset(AppImages.promo),
            ),
            SizedBox(height: 20 * h),
            Line(),
            SizedBox(height: 20 * h),
            Text(
              'Payment Details',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20 * h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$46 x 3 Nights',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
                Text(
                  '\$100',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15 * h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cleaning Fee',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
                Text(
                  '\$4',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15 * h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total (USD)',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$104',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 28, top: 18),
        color: AppColors.appBarButtonColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 54 * h,
              decoration: BoxDecoration(
                color: AppColors.primaryBlueColor,

                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  'Select Payment',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
