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
      final query =
          await _firestore
              .collection('reviews')
              .where('hotelId', isEqualTo: hotelId)
              .get();

      final reviews =
          query.docs.map((doc) {
            final data = doc.data();
            return ReviewsModel.fromJson(data);
          }).toList();

      emit(ReviewsLoaded(reviews));
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }

  /// Add a new review
  Future<void> addReview(
    String hotelId,
    ReviewsModel review,
    ReviewsModel reting,
  ) async {
    try {
      await _firestore.collection('reviews').add({
        'hotelId': hotelId,
        ...review.toJson(),
      });
      fetchReviews(hotelId); // refresh after adding
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }

  /// Delete review by document ID
  Future<void> deleteReview(String reviewId, String hotelId) async {
    try {
      await _firestore.collection('reviews').doc(reviewId).delete();
      fetchReviews(hotelId); // refresh after deletion
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }
}
