import 'dart:io';

import 'package:fruits/core/entitys/reviews_entity.dart';

class ProductEntity {
  final String title;
  final String? id;
  final String content;
  final num price;
  final String imgUrl;

  final bool isFeatured;
  final int exprationMounthes;
  final bool isOrgainc;
  final num numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int quantity;
  final List<ReviewEntity> reviewList;
  final String code;

  ProductEntity({
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.title,
    required this.content,
    required this.price,
    required this.imgUrl,

    required this.code,
    this.id,

    required this.isFeatured,
    required this.exprationMounthes,
    required this.isOrgainc,
    required this.numberOfCalories,
    required this.quantity,
    required this.reviewList,
  });
}
