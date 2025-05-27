import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/reviews_model.dart';
import 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());

  final _firestore = FirebaseFirestore.instance;

  /// Fetch all reviews for a hotel
  Future<void> fetchReviews(String hotelId) async {
    emit(ReviewsLoading());
    try {
      // Firestore'dan reviews collection'dan hotelId bo'yicha ma'lumotlarni olish
      final query =
          await _firestore
              .collection('hotels')
              .doc(hotelId)
              .collection("reviews")
              .get();

      // Agar hech qanday hujjat topilmasa, bo'sh ro'yxat qaytarish
      if (query.docs.isEmpty) {
        print("review yoqqqqhwbhqhwbqeyuqwbuqwvbehyvqwveyqwvy");
        emit(ReviewsLoaded(const []));
        return;
      }

      // Hujjatlarni ReviewsModel obyektlariga aylantirish
      final reviews =
          query.docs.map((doc) {
            print("===================");
            print(doc.data());
            final data = doc.data();
            // Ma'lumotlar to'g'ri formatda ekanligini tekshirish
            if (data.isNotEmpty) {
              print("=======2@2=2=2=22=2=2222======");
              print(doc.data());
              return ReviewsModel.fromJson(doc.data());
            } else {
              throw Exception('Review ma\'lumotlari noto\'g\'ri formatda');
            }
          }).toList();

      emit(ReviewsLoaded(reviews));
    } catch (e) {
      // Xato haqida aniqroq ma'lumot berish
      final errorMessage =
          e is FirebaseException
              ? 'Firestore xatosi: ${e.message}'
              : 'Noma\'lum xato: $e';
      emit(ReviewsError(errorMessage));
    }
  }

  /// Add a new review
  Future<void> addReview(String hotelId, ReviewsModel review) async {
    try {
      await _firestore
          .collection('hotels')
          .doc(hotelId)
          .collection("reviews")
          .add({'hotelId': hotelId, ...review.toJson()});
      await fetchReviews(hotelId);
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }

  /// Delete review by document ID
  Future<void> deleteReview(String reviewId, String hotelId) async {
    try {
      await _firestore.collection('reviews').doc(reviewId).delete();
      fetchReviews(hotelId);
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }
}
