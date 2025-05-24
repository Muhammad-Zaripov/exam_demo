import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/my_buttom.dart';
import '../../../../core/widgets/my_text.dart';
import '../../../auth/presentation/pages/login_screen.dart';

class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  final ValueNotifier<int> index = ValueNotifier<int>(0);

  final List<String> imges = [
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
    AppImages.onBoarding4,
  ];
  final List<String> title1 = [
    "Find Hundreds of Hotels",
    "Make a Destination Plan",
    "Let’s Discover the World",
    "Welcome to Hotelyn",
  ];
  final List<String> title2 = [
    "Discover hundreds of hotels that spread across the world for you",
    "Choose the location and we have many hotel recommendations wherever you are",
    "Book your hotel right now for the next level travel. Enjoy your trip!",
    "If you are new here please create your account first before book the hotel.",
  ];

  void nextPage() {
    if (index.value < 3) {
      index.value++;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  Widget buildDots(int i) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: index.value == i ? 10 : 6,
      height: index.value == i ? 10 : 6,
      decoration: BoxDecoration(
        color: index.value == i ? Colors.blue : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);

    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: index,
        builder: (context, value, _) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder:
                (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
            child: Column(
              key: ValueKey(value),
              children: [
                SizedBox(height: value == 3 ? 305 * w : 0),
                SizedBox(
                  width: double.infinity,
                  child:
                      value == 3
                          ? SizedBox(
                            width: 50 * w,
                            height: 50 * w,
                            child: Image.asset(imges[value]),
                          )
                          : Image.asset(imges[value], fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(45),
                  child: Column(
                    children: [
                      MyText(title1: title1[value], title2: title2[value]),
                      SizedBox(height: 40 * w),
                      if (value < 3)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, buildDots),
                        ),
                      SizedBox(height: value != 3 ? 30 : 100 * w),
                      MyButtom(
                        title: value <= 2 ? "Continue" : "Get Started",
                        value: nextPage,
                      ),
                      SizedBox(height: 35),
                      GestureDetector(
                        onTap: () {
                          if (value < 3) {
                            index.value = 3;
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          value == 3 ? "Login" : "Skip",
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
