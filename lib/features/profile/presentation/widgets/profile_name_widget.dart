import 'package:exam_4_oy_demo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exam_4_oy_demo/core/extensions/screen_size.dart';

class ProfileNameWidget extends StatefulWidget {
  final String lastName;
  final String secondName;
  final image;
  const ProfileNameWidget({
    super.key,
    required this.image,
    required this.lastName,
    required this.secondName,
  });

  @override
  State<ProfileNameWidget> createState() => _ProfileNameWidgetState();
}

class _ProfileNameWidgetState extends State<ProfileNameWidget> {
  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.widthFactor(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              width: 100 * w,
              height: 100 * w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.asset(widget.image, fit: BoxFit.cover),
              ),
            ),
            Text(
              widget.lastName,
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              widget.secondName,
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textFieldDarkIconsColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
