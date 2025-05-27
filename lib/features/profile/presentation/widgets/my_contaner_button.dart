import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContanerButton extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final Color color;
  final Color textColor;

  const MyContanerButton({
    super.key,
    required this.color,
    required this.height,
    required this.title,
    required this.width,
    required this.textColor,
  });

  @override
  State<MyContanerButton> createState() => _MyContanerButtonState();
}

class _MyContanerButtonState extends State<MyContanerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          widget.title,
          style: GoogleFonts.dmSans(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
