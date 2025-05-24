import '../../../../core/models/hotel_model.dart';

class UserModel {
  final String userName;
  final String userImage;
  final String userId;
  final int transactionCount;
  final String phonoNumber;
  final List<HotelModel> favoriteHotels;
  final int reviews;
  final int bookingCount;
  final DateTime? startDate;
  final DateTime? endDate;
  UserModel({
    required this.userName,
    required this.userImage,
    required this.userId,
    required this.transactionCount,
    required this.phonoNumber,
    required this.favoriteHotels,
    required this.reviews,
    required this.bookingCount,
    this.startDate,
    this.endDate,
  });
}
