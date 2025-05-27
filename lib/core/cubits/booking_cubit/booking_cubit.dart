import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/booking_model.dart';

class BookingCubit extends Cubit<BookingModel?> {
  BookingCubit() : super(null);

  void setBooking({
    required DateTime checkIn,
    required DateTime checkOut,
    required int pricePerNight,
  }) {
    final nights = checkOut.difference(checkIn).inDays;
    final total = nights * pricePerNight;

    emit(
      BookingModel(
        checkInDate: checkIn,
        checkOutDate: checkOut,
        totalNights: nights,
        totalPrice: total,
      ),
    );
  }

  void clearBooking() {
    emit(null);
  }
}
