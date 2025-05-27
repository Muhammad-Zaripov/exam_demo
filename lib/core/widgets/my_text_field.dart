import 'package:flutter/material.dart';
import '../extensions/screen_size.dart';
import '../utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final bool isPassword;
  final bool readOnly;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final double height;
  final double borderRadius;
  final Color? color;

  const MyTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.suffix,
    this.isPassword = false,
    this.readOnly = false,
    this.onChanged,
    this.validator,
    this.height = 56,
    this.borderRadius = 12,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        readOnly: readOnly,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          filled: true,
          fillColor: AppColors.textFieldDarkColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: ((height - 20) / 2),
            horizontal: 16,
          ),
          prefixIcon:
              prefix != null
                  ? Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [prefix!, SizedBox(width: 15 * w)],
                    ),
                  )
                  : null,

          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),

          suffixIcon:
              suffix != null
                  ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: suffix,
                  )
                  : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: AppColors.textFieldDarkColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
