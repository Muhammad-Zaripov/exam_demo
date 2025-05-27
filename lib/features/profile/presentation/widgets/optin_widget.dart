import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';

class OptinWidget extends StatefulWidget {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final icon1;
  // ignore: prefer_typing_uninitialized_variables
  final icon2;
  // ignore: prefer_typing_uninitialized_variables
  final icon22;
  final VoidCallback? next;
  const OptinWidget({
    super.key,

    required this.icon22,
    required this.icon1,
    required this.icon2,
    required this.title,
    this.next,
  });

  @override
  State<OptinWidget> createState() => _OptinWidgetState();
}

class _OptinWidgetState extends State<OptinWidget> {
  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.widthFactor(context);

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: widget.next,
      child: Ink(
        width: 330 * w,
        height: 52 * w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.recomendedHotelColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(widget.icon22),
              SizedBox(width: 10),
              Text(
                widget.title,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Spacer(),
              // ignore: deprecated_member_use
              SvgPicture.asset(widget.icon2, color: AppColors.backgroundColor),
            ],
          ),
        ),
      ),
    );
  }
}
