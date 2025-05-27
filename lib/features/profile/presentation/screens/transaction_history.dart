import 'package:exam_4_oy_demo/core/utils/app_colors.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/widgets/my_contaner_widget2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/my_icon_widget.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.widthFactor(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50 * w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyIconWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icon1: AppImages.arrowLeft,
                ),
                Text(
                  "Transaction History",
                  style: GoogleFonts.dmSans(fontSize: 16, color: Colors.white),
                ),
                Text("             "),
              ],
            ),
            SizedBox(height: 30 * w),
            Text(
              "My Bookings",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20 * w),
            MyWidget2(
              data: "28 Mar 2022, Thu",
              hotelInfo: "4 Guests, 2 Room",
              hotelName: "Hyatt Washington Hotel",
              hotelStatus: "Waiting",
              image: AppImages.image,
              price: "\$274",
              totalPrinceText: "Total Price",
              containerColor: AppColors.recomendedHotelColor,
            ),
            SizedBox(height: 30 * w),
            Text(
              "My Bookings",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20 * w),
            MyWidget2(
              data: "28 Mar 2022, Thu",
              hotelInfo: "4 Guests, 2 Room",
              hotelName: "Hyatt Washington Hotel",
              hotelStatus: "Waiting",
              image: AppImages.image,
              price: "\$274",
              totalPrinceText: "Total Price",
              containerColor: AppColors.recomendedHotelColor,
            ),
          ],
        ),
      ),
    );
  }
}
