class HotelModel {
  final String? id;
  final String name;
  final String about;
  final String image;
  final String location;
  final bool breakfast;
  final bool cancelations;
  final bool gym;
  final bool shower;
  final bool wifi;
  final num price;
  final num rating;
  final int reviews;
  final int bedCount;
  final double longitude;
  final double latitude;

  HotelModel({
    this.id,
    required this.longitude,
    required this.latitude,
    required this.name,
    required this.about,
    required this.image,
    required this.location,
    required this.breakfast,
    required this.cancelations,
    required this.gym,
    required this.shower,
    required this.wifi,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.bedCount,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] ?? '',
      longitude: json['longitude'] ?? 0,
      latitude: json['latitude'] ?? 0,
      name: json['name'] ?? '',
      about: json['about'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
      breakfast: json['breakfast'] ?? false,
      cancelations: json['cancelations'] ?? false,
      gym: json['gym'] ?? false,
      shower: json['shower'] ?? false,
      wifi: json['wifi'] ?? false,
      price: json['price'] ?? 0,
      rating: json['rating'] ?? 0,
      reviews: json['reviews'] ?? 0,
      bedCount: json['bedCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'longitude': longitude,
      'latitude': latitude,
      'name': name,
      'about': about,
      'image': image,
      'location': location,
      'breakfast': breakfast,
      'cancelations': cancelations,
      'gym': gym,
      'shower': shower,
      'wifi': wifi,
      'price': price,
      'rating': rating,
      'reviews': reviews,
      'bedCount': bedCount,
    };
  }
}
