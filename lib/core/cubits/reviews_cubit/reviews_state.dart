// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import '../../../../../core/models/reviews_model.dart';

abstract class ReviewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<ReviewsModel> reviews;

  ReviewsLoaded(this.reviews);

  @override
  List<Object?> get props => [reviews];
}

class ReviewsError extends ReviewsState {
  final String message;

  ReviewsError(this.message);

  @override
  List<Object?> get props => [message];
}
