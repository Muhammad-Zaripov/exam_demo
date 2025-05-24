import 'package:exam_4_oy_demo/core/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exam_4_oy_demo/core/utils/app_colors.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/my_buttom.dart';
import '../../data/model/auth_model.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widget/icons_buttom.dart';
import '../widget/my_text_from_fild.dart';
import '../widget/my_text_from_fild2.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorText = "";

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        AuthModel(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.status == AuthStatus.authenticated) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => MyBottomNavigationBar()),
                  );
                } else if (state.status == AuthStatus.failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage ?? 'Xatolik yuz berdi'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 75 * w),
                    Container(
                      width: 45 * w,
                      height: 45 * w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                      ),

                      child: Center(
                        child: SvgPicture.asset(AppImages.arrowLeft),
                      ),
                    ),
                    SizedBox(height: 30 * w),
                    Text(
                      "Welcome to Homelyn",
                      style: GoogleFonts.dmSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 10 * w),
                    Text(
                      "Please login to your account",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightWhiteTextColor,
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

                    MyTextFromFild2(
                      controller: _passwordController,
                      title: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Parolni kiriting";
                        }
                        return null;
                      },
                      icon: SizedBox(
                        width: 20 * w,
                        height: 20 * w,
                        child: SvgPicture.asset(AppImages.lock),
                      ),
                      name: "Enter your password",
                      visibility: (isVisibil) {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: AppColors.primaryBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 75 * w),
                    MyButtom(
                      title: "Agree and Continue",
                      value: () {
                        state.status == AuthStatus.loading
                            ? Center(child: CircularProgressIndicator())
                            : _submit();
                      },
                    ),
                    SizedBox(height: 20 * w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Or login with",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              color: AppColors.lightWhiteTextColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20 * w),
                    MyIconsButtom(),
                    SizedBox(height: 20 * w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: GoogleFonts.dmSans(
                            color: AppColors.blackColor,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              color: AppColors.primaryBlueColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
