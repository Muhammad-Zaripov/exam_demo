import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/my_icon_widget.dart';

class MyCuponScreen extends StatefulWidget {
  const MyCuponScreen({super.key});

  @override
  State<MyCuponScreen> createState() => _MyCuponScreenState();
}

class _MyCuponScreenState extends State<MyCuponScreen> {
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
              "4 Ready to Use",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20 * w),
          ],
        ),
      ),
    );
  }
}
