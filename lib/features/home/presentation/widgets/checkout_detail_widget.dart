import 'package:flutter/material.dart';
import '../../../../core/extensions/screen_size.dart';

class CheckoutDetailWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  const CheckoutDetailWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      width: 327 * w,
      height: 54 * h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(spacing: 10, children: [icon, Text(title)]),
    );
  }
}
