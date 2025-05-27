import 'package:exam_4_oy_demo/core/extensions/screen_size.dart';
import 'package:exam_4_oy_demo/core/utils/app_images.dart';
import 'package:exam_4_oy_demo/core/widgets/my_icon_widget.dart';
import 'package:exam_4_oy_demo/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_4_oy_demo/features/auth/presentation/pages/login_screen.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/screens/favourite_screen.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/screens/my%20_cupon_screen.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/screens/settings_screen.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/screens/transaction_history.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/widgets/my_contaner_widget.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/widgets/optin_widget.dart';
import 'package:exam_4_oy_demo/features/profile/presentation/widgets/profile_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.widthFactor(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50 * w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                MyIconWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => SettingsScreen()),
                    );
                  },
                  icon1: AppImages.setting_22,
                ),
              ],
            ),
            SizedBox(height: 35 * w),
            ProfileNameWidget(
              image: AppImages.profile1,
              lastName: "Marrine Gustav",
              secondName: "Purwokerto, Indonesia",
            ),
            SizedBox(height: 25),
            MyContanerWidget(
              bookings: "4",
              bookings2: "Bookings",
              review: "12",
              review2: "Review",
              transaction: "26",
              transaction2: "Transaction",
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Option",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20 * w),
                OptinWidget(
                  next: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (x) => FavouriteScreen()),
                    );
                  },
                  icon1: AppImages.heart,
                  icon22: AppImages.heart,
                  icon2: AppImages.vector,
                  title: "My Favourite",
                ),
                SizedBox(height: 15),
                OptinWidget(
                  next: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (x) => TransactionHistory()),
                    );
                  },
                  icon1: AppImages.clock,
                  icon2: AppImages.vector,
                  icon22: AppImages.clock2,
                  title: "Transaction",
                ),
                SizedBox(height: 15),
                OptinWidget(
                  next: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (x) => MyCuponScreen()),
                    );
                  },
                  icon1: AppImages.discountShape,
                  icon2: AppImages.vector,
                  icon22: AppImages.discountShape2,
                  title: "My Cupon",
                ),
                SizedBox(height: 15),
                OptinWidget(
                  next: () {
                    context.read<AuthCubit>().logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (x) => LoginScreen()),
                    );
                  },
                  icon1: AppImages.logout,
                  icon22: AppImages.logout,
                  icon2: AppImages.vector,
                  title: " Log Out",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
