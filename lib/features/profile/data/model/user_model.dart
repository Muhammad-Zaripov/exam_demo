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
  final String? hotelID;

  UserModel({
    this.hotelID,
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

  UserModel copyWith({
    String? userName,
    String? userImage,
    String? userId,
    int? transactionCount,
    String? phonoNumber,
    List<HotelModel>? favoriteHotels,
    int? reviews,
    int? bookingCount,
    DateTime? startDate,
    DateTime? endDate,
    String? hotelID,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      userId: userId ?? this.userId,
      transactionCount: transactionCount ?? this.transactionCount,
      phonoNumber: phonoNumber ?? this.phonoNumber,
      favoriteHotels: favoriteHotels ?? this.favoriteHotels,
      reviews: reviews ?? this.reviews,
      bookingCount: bookingCount ?? this.bookingCount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      hotelID: hotelID ?? this.hotelID,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'] as String,
      userImage: json['userImage'] as String,
      userId: json['userId'] as String,
      transactionCount: json['transactionCount'] as int,
      phonoNumber: json['phonoNumber'] as String,
      favoriteHotels: (json['favoriteHotels'] as List<dynamic>)
          .map((hotelJson) => HotelModel.fromJson(hotelJson as Map<String, dynamic>))
          .toList(),
      reviews: json['reviews'] as int,
      bookingCount: json['bookingCount'] as int,
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate'] as String) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate'] as String) : null,
      hotelID: json['hotelID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userImage': userImage,
      'userId': userId,
      'transactionCount': transactionCount,
      'phonoNumber': phonoNumber,
      'favoriteHotels': favoriteHotels.map((hotel) => hotel.toJson()).toList(),
      'reviews': reviews,
      'bookingCount': bookingCount,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'hotelID': hotelID,
    };
  }
}
