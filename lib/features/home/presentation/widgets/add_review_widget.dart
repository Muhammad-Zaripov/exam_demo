import 'package:exam_4_oy_demo/core/models/reviews_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/cubits/reviews_cubit/reviews_cubit.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_text_field.dart';

class AddReviewWidget extends StatefulWidget {
  final String hotelId;
  const AddReviewWidget({super.key, required this.hotelId});

  @override
  State<AddReviewWidget> createState() => _AddReviewWidgetState();
}

class _AddReviewWidgetState extends State<AddReviewWidget> {
  final titleController = TextEditingController();
  final ratingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            controller: titleController, // To‘g‘ri controller ulandi
            borderRadius: 20,
          ),
          SizedBox(height: 20),
          MyTextField(
            hintText: "Rating (0-5)",
            controller: ratingController, // To‘g‘ri controller ulandi
            borderRadius: 20,
            keyboardType: TextInputType.number, // Faqat raqam kiritish uchun
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
                  final ratingText = ratingController.text.trim();

                  // Bo‘sh maydonlarni tekshirish
                  if (title.isEmpty || ratingText.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Iltimos sharh va bahoni to‘ldiring'),
                      ),
                    );
                    return;
                  }

                  // Rating’ni double’ga aylantirish
                  double? rating;
                  try {
                    rating = double.parse(ratingText);
                    if (rating < 0 || rating > 5) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Baholash 0 dan 5 gacha bo‘lishi kerak',
                          ),
                        ),
                      );
                      return;
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Iltimos, to‘g‘ri raqam kiriting'),
                      ),
                    );
                    return;
                  }

                  final review = ReviewsModel(
                    rating: ratingController.text,
                    title: titleController.text,
                    userId: FirebaseAuth.instance.currentUser!.uid,
                  );

                  context.read<ReviewsCubit>().addReview(
                    widget.hotelId,
                    review,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sharh muvaffaqiyatli qo‘shildi'),
                    ),
                  );

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
