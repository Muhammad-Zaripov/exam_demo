class BookingModel {
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int totalNights;
  final int totalPrice;

  BookingModel({
    required this.checkInDate,
    required this.checkOutDate,
    required this.totalNights,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() => {
    'checkInDate': checkInDate.toIso8601String(),
    'checkOutDate': checkOutDate.toIso8601String(),
    'totalNights': totalNights,
    'totalPrice': totalPrice,
  };

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    checkInDate: DateTime.parse(json['checkInDate']),
    checkOutDate: DateTime.parse(json['checkOutDate']),
    totalNights: json['totalNights'],
    totalPrice: json['totalPrice'],
  );
}
