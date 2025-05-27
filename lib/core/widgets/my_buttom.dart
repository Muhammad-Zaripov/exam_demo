import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extensions/screen_size.dart';
import '../utils/app_colors.dart';

class MyButtom extends StatefulWidget {
  final String title;
  final Function() value;
  final Color? color;
  final bool isLoading;

  const MyButtom({
    super.key,
    required this.title,
    required this.value,
    this.color,
    this.isLoading = false,
  });

  @override
  State<MyButtom> createState() => _MyButtomState();
}

class _MyButtomState extends State<MyButtom> {
  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.widthFactor(context);
    final h = ScreenSize.heightFactor(context);

    return InkWell(
      borderRadius: BorderRadius.circular(45),
      onTap: widget.isLoading ? null : widget.value,
      child: Container(
        width: 330 * w,
        height: 55 * h,
        decoration: BoxDecoration(
          color: widget.color ?? AppColors.primaryBlueColor,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Center(
          child:
              widget.isLoading
                  ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                  : Text(
                    widget.title,
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
        ),
      ),
    );
  }
}
