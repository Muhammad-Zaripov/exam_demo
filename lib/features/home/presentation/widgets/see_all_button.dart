import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';

class SeeAllButton extends StatelessWidget {
  final String title;
  final String? seeAllText;
  final VoidCallback? onTap; // nullable
  const SeeAllButton({
    super.key,
    required this.title,
    this.onTap,
    this.seeAllText = 'See All',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            seeAllText!,
            style: GoogleFonts.dmSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}
