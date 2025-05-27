import 'package:exam_4_oy_demo/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_4_oy_demo/features/auth/presentation/widget/my_text_from_fild2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/my_buttom.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _confirmPassworController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _globalKey,
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
                  "Create New Password",
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10 * w),
                Text(
                  "Enter the phone number, we’ll send the code",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightWhiteTextColor,
                  ),
                ),
                SizedBox(height: 40 * w),
                MyTextFromFild2(
                  controller: _passwordController,
                  title: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Parolni kiriting kiriting";
                    }
                    if (value.length < 8) {
                      return "Parol uzunligi sta iboradan kop bolishi kerak";
                    }
                    return null;
                  },
                  icon: SizedBox(
                    width: 17 * w,
                    height: 17 * w,
                    child: SvgPicture.asset(AppImages.lock),
                  ),
                  name: "Enter your new password",
                  visibility: (isVisibil) {},
                ),

                SizedBox(height: 20 * w),
                MyTextFromFild2(
                  visibility: (isVisibil) {},
                  controller: _confirmPassworController,
                  title: "Confirm Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Parolni kiriting kiriting";
                    }

                    if (value != _passwordController.text) {
                      return "Parol mos emas";
                    }
                    return null;
                  },
                  icon: SizedBox(
                    width: 17 * w,
                    height: 17 * w,
                    child: SvgPicture.asset(AppImages.lock),
                  ),
                  name: "Enter your confirm password",
                ),
                SizedBox(height: 20 * w),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: MyButtom(
          title: "Reset Password",
          value: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  maxChildSize: 0.7,
                  expand: false,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 20),
                              width: 60,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            // Image.asset(AppImages.iIllustrationmage),
                            SizedBox(height: 30),
                            Text(
                              "Change Password Success",
                              style: GoogleFonts.dmSans(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "We have updated your password. Please remember your password. Thank you!",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textFieldDarkIconsColor,
                              ),
                            ),
                            SizedBox(height: 65),
                            MyButtom(
                              title: "Login",
                              value: () {
                                if (_globalKey.currentState!.validate()) {
                                  context.read<AuthCubit>().updatePassword(
                                    _passwordController.text,
                                  );
                                }
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (ctx) => NewPasswordScreen(),
                                //   ),
                                // );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
