import 'package:exam_4_oy_demo/core/widgets/my_buttom.dart';
import 'package:exam_4_oy_demo/features/auth/presentation/widget/my_text_from_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 75 * w),
                Container(
                  width: 45 * w,
                  height: 45 * w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),

                  child: Center(child: SvgPicture.asset(AppImages.arrowLeft)),
                ),
                SizedBox(height: 30 * w),
                Text(
                  "Forgot Password",
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10 * w),
                Text(
                  "We’ve send verification code to +62 1283972849 ",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
                SizedBox(height: 40 * w),
                MyTextFromFild(
                  controller: _emailController,
                  title: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Emailni kiriting";
                    }
                    return null;
                  },
                  icon: SizedBox(
                    width: 17 * w,
                    height: 17 * w,
                    child: Icon(
                      Icons.email_outlined,
                      color: AppColors.lightWhiteButtomCollor,
                    ),
                  ),
                  name: "Enter your email addres",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: MyButtom(title: "Send Code", value: () {}),
      ),
    );
  }
}
