import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/my_text_field.dart';
import '../../../home/presentation/screens/notification_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Messages',
            style: GoogleFonts.dmSans(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (cxt) => NotificationScreen()),
                    );
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
                      AppImages.notification,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 13,
                  right: 17,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 20), // Top spacing
            MyTextField(
              prefix: SvgPicture.asset(AppImages.searchNormal),
              hintText: 'Search hotel',
              suffix: SvgPicture.asset(AppImages.sort),
              borderRadius: 30,
            ),
            Spacer(),
            Image.asset(AppImages.chat_image),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
