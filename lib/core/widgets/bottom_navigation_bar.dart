import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../features/chat/presentation/screens/chat_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({super.key});
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  Color getIconColor(int index, int currentIndex) {
    if (currentIndex == index) {
      return AppColors.primaryBlueColor;
    } else {
      return AppColors.textFieldDarkIconsColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndexNotifier,
      builder: (context, currentIndex, _) {
        return Scaffold(
          body: IndexedStack(index: currentIndex, children: _screens),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => _currentIndexNotifier.value = index,
            selectedLabelStyle: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            selectedItemColor: AppColors.primaryBlueColor,
            unselectedLabelStyle: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            unselectedItemColor: AppColors.textFieldDarkIconsColor,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 0
                        ? SvgPicture.asset(
                          AppImages.homeSelect,
                          width: 24,
                          height: 24,
                        )
                        : SvgPicture.asset(
                          AppImages.home,
                          width: 24,
                          height: 24,
                        ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 1
                        ? SvgPicture.asset(
                          AppImages.searchNormalSelect,
                          width: 24,
                          height: 24,
                        )
                        : SvgPicture.asset(
                          AppImages.searchNormal,
                          width: 24,
                          height: 24,
                        ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 2
                        ? SvgPicture.asset(
                          AppImages.messageSelect,
                          width: 24,
                          height: 24,
                        )
                        : SvgPicture.asset(
                          AppImages.message,
                          width: 24,
                          height: 24,
                        ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 3
                        ? SvgPicture.asset(
                          AppImages.userSelect,
                          width: 24,
                          height: 24,
                        )
                        : SvgPicture.asset(
                          AppImages.user,
                          width: 24,
                          height: 24,
                        ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
