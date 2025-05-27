import 'package:exam_4_oy_demo/core/utils/app_images.dart';
import 'package:exam_4_oy_demo/features/home/presentation/widgets/nearby_hotel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/widgets/my_icon_widget.dart';
import '../../../home/presentation/cubits/hotel_cubit/hotel_cubit.dart';
import '../../../home/presentation/cubits/hotel_cubit/hotel_state.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.widthFactor(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyIconWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon1: AppImages.arrowLeft,
                  ),

                  Text(
                    "Favourite",
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(""),
                ],
              ),
              SizedBox(height: 30 * w),
              Text("8 Favourite Items"),
              SizedBox(height: 20 * w),
              BlocBuilder<HotelCubit, HotelState>(
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.hotels.length,
                    itemBuilder: (context, index) {
                      if (state.hotels.isEmpty) {
                        return Center(child: Text("Ma'lumot yoq"));
                      }
                      return NearbyHotelWidget(hotel: state.hotels[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10 * w);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
