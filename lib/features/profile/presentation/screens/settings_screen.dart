import 'package:exam_4_oy_demo/features/profile/presentation/widgets/optin_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/my_icon_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                  "Settings",
                  style: GoogleFonts.dmSans(fontSize: 16, color: Colors.white),
                ),
                Text("             "),
              ],
            ),
            SizedBox(height: 30 * w),
            Text(
              "Account Settings",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            OptinWidget(
              next: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (x) => FavouriteScreen()),
                // );
              },
              icon1: AppImages.user,
              icon22: AppImages.user2,
              icon2: AppImages.vector,
              title: "My Profile",
            ),
            SizedBox(height: 15 * w),
            OptinWidget(
              next: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (x) => FavouriteScreen()),
                // );
              },
              icon1: AppImages.notification,
              icon22: AppImages.notification,
              icon2: AppImages.vector,
              title: "Notifications",
            ),
            SizedBox(height: 15 * w),
            OptinWidget(
              next: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (x) => FavouriteScreen()),
                // );
              },
              icon1: AppImages.moneys,
              icon22: AppImages.moneys2,
              icon2: AppImages.vector,
              title: "Payments and Payouts",
            ),
            SizedBox(height: 30 * w),
            Text(
              "Preferences",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            OptinWidget(
              next: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (x) => FavouriteScreen()),
                // );
              },
              icon1: AppImages.quluf,
              icon22: AppImages.quluf2,
              icon2: AppImages.vector,
              title: "Language",
            ),
            SizedBox(height: 15 * w),
            OptinWidget(
              next: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (x) => FavouriteScreen()),
                // );
              },
              icon1: AppImages.moon,
              icon22: AppImages.moon2,
              icon2: AppImages.vector,
              title: "Dark Mode",
            ),
            SizedBox(height: 15 * w),
            OptinWidget(
              next: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (x) => FavouriteScreen()),
                // );
              },
              icon1: AppImages.global2,
              icon22: AppImages.global2,
              icon2: AppImages.vector,
              title: "Privacy Settings",
            ),
          ],
        ),
      ),
    );
  }
}
