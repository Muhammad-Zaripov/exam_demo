// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import '../../models/booking_model.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {}

class BookingSelected extends BookingState {
  final BookingModel booking;

  const BookingSelected(this.booking);

  @override
  List<Object?> get props => [booking];
}
