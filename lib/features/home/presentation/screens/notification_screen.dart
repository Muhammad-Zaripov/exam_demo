import 'package:exam_4_oy_demo/core/widgets/line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/see_all_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'System Alert',
        'subtitle':
            'Please complete your profile! To make a sure that you remain our user.',
        'time': '1 m ago',
        'image': AppImages.war,
      },
      {
        'title': 'New User Discount',
        'subtitle':
            'Special for new user! You will get 50% off discount in every places.',
        'time': '19 m ago',
        'image': AppImages.not1,
      },
      {
        'title': 'Booking Completed',
        'subtitle':
            'You’ve booked in Invinity Castle Hotel. Please don’t be late to check in.',
        'time': '1 d ago',
        'image': AppImages.not2,
      },
    ];
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
          'Notification',
          style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: SeeAllButton(title: 'Recent', seeAllText: 'Mark All Read'),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 5),
              itemCount: notifications.length,
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Line(),
                    ),
                    SizedBox(height: 15),
                  ],
                );
              },
              itemBuilder: (contex, index) {
                final not = notifications[index];
                return ListTile(
                  leading: SvgPicture.asset(not['image'] ?? ''),
                  title: Text(not['title'] ?? ''),
                  subtitle: Text(not['subtitle'] ?? ''),
                  trailing: Text(not['time'] ?? ''),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
