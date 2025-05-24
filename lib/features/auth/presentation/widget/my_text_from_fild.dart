import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';

class MyTextFromFild extends StatefulWidget {
  final String name;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final SizedBox icon;
  const MyTextFromFild({
    super.key,
    required this.controller,
    required this.title,
    required this.validator,
    required this.icon,
    required this.name,
  });

  @override
  State<MyTextFromFild> createState() => _MyTextFromFildState();
}

class _MyTextFromFildState extends State<MyTextFromFild> {
  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: GoogleFonts.dmSans(
            fontSize: 16,
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10 * w),
        SizedBox(
          width: 330 * w,

          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 14, right: 10),
                child: widget.icon,
              ),

              prefixIconConstraints: BoxConstraints(
                minWidth: 40,
                minHeight: 40,
                maxWidth: 50,
                maxHeight: 50,
              ),
              hintText: widget.title,
              hintStyle: GoogleFonts.dmSans(
                fontSize: 14,
                color: AppColors.lightWhiteTextColor,
              ),
            ),

            validator: widget.validator,
          ),
        ),
        SizedBox(height: 20 * w),
      ],
    );
  }
}
