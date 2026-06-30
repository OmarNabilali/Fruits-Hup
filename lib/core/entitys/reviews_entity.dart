class ReviewEntity {
  final String name;
  final String image;
  final String date;
  final String reviewDescribtion;
  final num rating;

  ReviewEntity({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDescribtion,
    required this.rating,
  });

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'date': date,
      'reviewDescribtion': reviewDescribtion,
      'image': image,
      'rating': rating,
    };
  }
}
