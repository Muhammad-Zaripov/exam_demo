import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/widgets/my_buttom.dart';
import '../../../../core/widgets/my_icon_widget.dart';
import '../../data/model/auth_model.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widget/my_text_from_fild.dart';
import '../widget/my_text_from_fild2.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final authCubit = context.read<AuthCubit>();
      await authCubit.register(
        AuthModel(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
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
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 75 * w),
                    MyIconWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      icon1: AppImages.arrowLeft,
                    ),
                    SizedBox(height: 30 * w),

                    Text(
                      "Welcome to Homelyn",
                      style: GoogleFonts.dmSans(
                        fontSize: 24,
                        color: AppColors.primaryBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10 * w),
                    Text(
                      "Let’s create your account first",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightWhiteTextColor,
                      ),
                    ),
                    SizedBox(height: 40 * w),
                    MyTextFromFild(
                      controller: _nameController,
                      title: "Enter your name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ismingizni kiriting";
                        }
                        return null;
                      },
                      icon: SizedBox(
                        width: 20 * w,
                        height: 20 * w,
                        child: SvgPicture.asset(AppImages.person),
                      ),
                      name: "Full Name",
                    ),
                    MyTextFromFild(
                      title: "Email",
                      controller: _emailController,
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
                      name: "Enter your email",
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
                      visibility: (isVisibil) {
                        isVisibil = !isVisibil;
                      },
                    ),
                    SizedBox(height: 100 * w),
                    MyButtom(
                      title: "Agree and Continue",
                      value: () {
                        state.status == AuthStatus.loading
                            ? Center(child: CircularProgressIndicator())
                            : _submit();
                      },
                      isLoading: state.status == AuthStatus.loading,
                    ),
                    SizedBox(height: 20 * w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account? ",
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
                                builder: (ctx) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
