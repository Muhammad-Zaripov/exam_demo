import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/helpers/theme_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/line_widget.dart';
import '../widgets/see_all_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDark(context);
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
                color: isDark ? AppColors.appBarButtonColor : Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              width: 44 * w,
              height: 44 * h,
              child: SvgPicture.asset(
                AppImages.arrowBack,
                // ignore: deprecated_member_use
                color: isDark ? Colors.white : Colors.black,
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
                  color: isDark ? AppColors.appBarButtonColor : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 44 * w,
                height: 44 * h,
                child: SvgPicture.asset(
                  AppImages.setting,
                  // ignore: deprecated_member_use
                  color: isDark ? Colors.white : Colors.black,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 7 * h),
              SeeAllButton(title: 'Recent', seeAllText: 'Mark All Read'),
              SizedBox(height: 18 * h),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Kim Hayo Send You a Message'),
                    trailing: Text('1 m ago'),
                    subtitle: Text(
                      'Hi mariana, are you looking for hotel in Purwokerto? You can check our hotel ....',
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(height: 15 * h),
                      Line(),
                      SizedBox(height: 15 * h),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
