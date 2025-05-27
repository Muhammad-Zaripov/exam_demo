import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import 'chekout_screen.dart';

class SelectDateScreen extends StatefulWidget {
  final HotelModel hotel;
  const SelectDateScreen({super.key, required this.hotel});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    final hotel = widget.hotel;

    return Scaffold(
      appBar: AppBar(
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
          'Select Dates',
          style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        leadingWidth: 68 * w,
        backgroundColor: Colors.black,
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
      ),
      body: SfDateRangePicker(
        headerHeight: 50 * h,
        headerStyle: DateRangePickerHeaderStyle(backgroundColor: Colors.black),
        selectionMode: DateRangePickerSelectionMode.multiRange,
        backgroundColor: Colors.black,
        startRangeSelectionColor: AppColors.primaryBlueColor,
        endRangeSelectionColor: AppColors.primaryBlueColor,
        // ignore: deprecated_member_use
        rangeSelectionColor: AppColors.primaryBlueColor.withOpacity(0.3),
        navigationDirection: DateRangePickerNavigationDirection.vertical,
        minDate: DateTime.now(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 28, top: 18),
        color: AppColors.appBarButtonColor,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: GoogleFonts.dmSans(
                    fontSize: 13,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '\$${hotel.price}',
                      style: GoogleFonts.dmSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlueColor,
                      ),
                    ),
                    Text(
                      '  Per Night',
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        color: AppColors.textFieldDarkIconsColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChekoutScreen(hotel: hotel),
                  ),
                );
              },
              child: Container(
                width: 173 * w,
                height: 54 * h,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Continue',
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
