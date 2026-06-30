import 'package:fruits/core/entitys/product_entity.dart';
import 'package:fruits/core/entitys/reviews_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String reviewDescribtion;
  final num rating;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDescribtion,
    required this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    print(json['reviews']);
    print(json['reviews'].runtimeType);
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: json['date'],
      reviewDescribtion: json['reviewDescribtion'],
      rating: json['rating'],
    );
  }

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      reviewDescribtion: reviewEntity.reviewDescribtion,
      rating: reviewEntity.rating,
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      date: date,
      reviewDescribtion: reviewDescribtion,
      rating: rating,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'reviewDescribtion': reviewDescribtion,
      'rating': rating,
    };
  }
}
