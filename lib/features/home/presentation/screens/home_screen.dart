import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/helpers/theme_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/my_text_field.dart';
import '../cubits/hotel_cubit/hotel_cubit.dart';
import '../cubits/hotel_cubit/hotel_state.dart';
import '../../../../core/models/hotel_model.dart';
import '../widgets/nearby_hotel_widget.dart';
import '../widgets/recomended_hotel_widget.dart';
import '../widgets/see_all_button.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> addHotelToFirestore(HotelModel hotel) async {
    try {
      await FirebaseFirestore.instance
          .collection('hotels')
          .doc(hotel.id)
          .set(hotel.toJson());
      // ignore: use_build_context_synchronously
      await context.read<HotelCubit>().fetchHotels();
      if (kDebugMode) {
        print('Hotel added successfully!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error adding hotel: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {}
    final isDark = ThemeHelper.isDark(context);
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65 * h),
        child: AppBar(
          forceMaterialTransparency: true,
          leadingWidth: 180 * w,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.appBarButtonColor : Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              width: 172 * w,
              height: 44 * h,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.location,
                    width: 22 * w,
                    height: 22 * h,
                  ),
                  SizedBox(width: 8 * w),
                  Text(
                    'Purwokerto, IND',
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    AppImages.arrowDown,
                    width: 12 * w,
                    height: 12 * h,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (cxt) => NotificationScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color:
                            isDark ? AppColors.appBarButtonColor : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: 44 * w,
                      height: 44 * h,
                      child: SvgPicture.asset(
                        AppImages.notification,
                        // ignore: deprecated_member_use
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 13,
                    right: 17,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(right: 24, left: 24, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Maria👋',
                style: GoogleFonts.dmSans(
                  color: AppColors.lightWhiteTextColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 6 * h),
              Text(
                'Let’s find best hotel',
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 33 * h),
              MyTextField(
                borderRadius: 30,
                height: 54,
                hintText: 'Search hotel',
                prefix: SvgPicture.asset(
                  AppImages.searchNormal,
                  // ignore: deprecated_member_use
                  color:
                      isDark
                          ? AppColors.textFieldDarkIconsColor
                          : AppColors.textFieldIconsColor,
                ),
                suffix: SvgPicture.asset(
                  AppImages.sort,
                  // ignore: deprecated_member_use
                  color:
                      isDark
                          ? AppColors.textFieldDarkIconsColor
                          : AppColors.textFieldIconsColor,
                ),
              ),
              SizedBox(height: 31 * h),
              SeeAllButton(title: 'Recomended Hotel'),
              SizedBox(
                height: 215 * h,
                child: BlocBuilder<HotelCubit, HotelState>(
                  builder: (context, state) {
                    return ListView.separated(
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.hotels.length,
                      itemBuilder: (context, index) {
                        return RecomendedHotelWidget(
                          hotel: state.hotels[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10 * w);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 32 * h),
              SeeAllButton(title: 'Nearby Hotels'),
              SizedBox(height: 20 * h),
              BlocBuilder<HotelCubit, HotelState>(
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.hotels.length,
                    itemBuilder: (context, index) {
                      return NearbyHotelWidget(hotel: state.hotels[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10 * h);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hotel = HotelModel(
            longitude: 123.456,
            latitude: 78.910,
            name: 'oka',
            about: 'juda zur',
            image:
                'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',

            location: 'bir joyda',
            breakfast: false,
            cancelations: false,
            gym: false,
            shower: false,
            wifi: false,
            price: 100,
            rating: 4,
            reviews: 120,
            bedCount: 1,
          );
          await addHotelToFirestore(hotel);
        },
      ),
    );
  }
}
