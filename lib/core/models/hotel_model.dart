import 'reviews_model.dart';

class HotelModel {
  final String id;
  final String name;
  final String about;
  final String image;
  final num rating;
  final int price;
  final int bedCount;
  final num latitude;
  final num longitude;
  final bool breakfast;
  final bool cancelations;
  final bool gym;
  final bool shower;
  final bool wifi;
  final String location;
  final List<ReviewsModel>? reviews;

  HotelModel({
    required this.id,
    required this.name,
    required this.about,
    required this.image,
    required this.rating,
    required this.price,
    required this.bedCount,
    required this.latitude,
    required this.longitude,
    required this.breakfast,
    required this.cancelations,
    required this.gym,
    required this.shower,
    required this.wifi,
    required this.location,
    this.reviews,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      about: json['about'],
      image: json['image'],
      rating: json['rating'],
      price: json['price'],
      bedCount: json['bedCount'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      breakfast: json['breakfast'],
      cancelations: json['cancelations'],
      gym: json['gym'],
      shower: json['shower'],
      wifi: json['wifi'],
      location: json['location'],
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map(
                (reviewJson) =>
                    ReviewsModel.fromJson(reviewJson as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'image': image,
      'rating': rating,
      'price': price,
      'bedCount': bedCount,
      'latitude': latitude,
      'longitude': longitude,
      'breakfast': breakfast,
      'cancelations': cancelations,
      'gym': gym,
      'shower': shower,
      'wifi': wifi,
      'location': location,
      'reviews': reviews?.map((review) => review.toJson()).toList(),
    };
  }
}
