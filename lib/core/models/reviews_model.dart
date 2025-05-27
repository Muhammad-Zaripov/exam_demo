class ReviewsModel {
  final String rating;
  final String title;
  final String userId;
  ReviewsModel({
    required this.rating,
    required this.title,
    required this.userId,
  });
  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      rating: (json['rating'] ?? 0),
      title: json['title'] ?? '',
      userId: json['userId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'rating': rating, 'title': title, 'userId': userId};
  }

  ReviewsModel copyWith({String? rating, String? title, String? userId}) {
    return ReviewsModel(
      rating: rating ?? this.rating,
      title: title ?? this.title,
      userId: userId ?? this.userId,
    );
  }
}
