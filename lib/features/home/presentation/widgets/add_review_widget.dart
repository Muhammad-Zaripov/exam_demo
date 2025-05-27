import 'package:exam_4_oy_demo/core/models/reviews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/cubits/reviews_cubit/reviews_cubit.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_text_field.dart';

class AddReviewWidget extends StatelessWidget {
  final String hotelId;
  const AddReviewWidget({super.key, required this.hotelId});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final ratingController = TextEditingController();

    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          MyTextField(
            hintText: "Review",
            controller: TextEditingController(),
            borderRadius: 20,
          ),
          SizedBox(height: 20),
          MyTextField(
            hintText: "Rating",
            controller: TextEditingController(),
            borderRadius: 20,
          ),
          SizedBox(height: 20 * h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 100 * w,
                  height: 40 * h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'Close',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final title = titleController.text.trim();
                  final rating = ratingController.text.trim();

                  if (title.isEmpty || rating.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Iltimos sharh va bahoni to‘ldiring'),
                      ),
                    );
                    return;
                  }

                  final review = ReviewsModel(
                    rating: rating,
                    title: title,
                    userId: '',
                  );

                  context.read<ReviewsCubit>().addReview(
                    hotelId,
                    review,
                    rating as ReviewsModel,
                  );
                  Navigator.of(context).pop(); // Modalni yopish
                },

                child: Container(
                  width: 100 * w,
                  height: 40 * h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'Add Review',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20 * h),
        ],
      ),
    );
  }
}
