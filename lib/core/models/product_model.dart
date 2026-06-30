import 'package:fruits/core/entitys/product_entity.dart';
import 'package:fruits/core/models/review_model.dart';

class ProductModel {
  final String title;
  final String? id;
  final String content;
  final num price;
  final String imgUrl;
  final int sellingCount;
  final bool isFeatured;
  final int exprationMounthes;
  final bool isOrgainc;
  final num numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final String code;

  ProductModel({
    this.id,
    this.ratingCount = 0,
    required this.imgUrl,
    required this.avgRating,
    required this.title,
    required this.content,
    required this.price,
    required this.isFeatured,
    required this.exprationMounthes,
    required this.isOrgainc,
    required this.numberOfCalories,
    required this.unitAmount,

    required this.reviews,
    required this.code,
    this.sellingCount = 0,
  });

  factory ProductModel.fromEntity(ProductEntity productEntity) {
    return ProductModel(
      imgUrl: productEntity.imgUrl,
      avgRating: productEntity.avgRating,
      title: productEntity.title,
      id: productEntity.id,
      content: productEntity.content,
      price: productEntity.price,

      isFeatured: productEntity.isFeatured,
      exprationMounthes: productEntity.exprationMounthes,
      isOrgainc: productEntity.isOrgainc,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.quantity,
      reviews: productEntity.reviewList
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
      code: productEntity.code,
    );
  }

  toJson() {
    return {
      'title': title,
      'content': content,
      // 'imgFile': imgFile,
      'price': price,
      'code': code,
      'sellingCount': sellingCount,
      'imgUrl': imgUrl,
      'isFeatured': isFeatured,
      'isOrgainc': isOrgainc,
      'exprationMounthes': exprationMounthes,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'numberOfCalories': numberOfCalories,
      'avgRating': avgRating,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      avgRating: avgRating,
      ratingCount: ratingCount,
      imgUrl: imgUrl,
      title: title,
      content: content,
      price: price,
      code: code,
      isFeatured: isFeatured,
      exprationMounthes: exprationMounthes,
      isOrgainc: isOrgainc,
      numberOfCalories: numberOfCalories,
      quantity: unitAmount,
      reviewList: reviews.map((e) => e.toEntity()).toList(),
      id: id,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imgUrl: json['imgUrl'] ?? '',
      sellingCount: json['sellingCount'] ?? 0,
      avgRating: json['avgRating'] ?? 0,
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)),
            )
          : [],
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      price: json['price'] ?? 0,
      code: json['code'] ?? '',
      id: json['id'], // ✅ لأنه أصلاً String?
      isFeatured: json['isFeatured'] ?? false,
      exprationMounthes: json['exprationMounthes'] ?? 0,
      isOrgainc: json['isOrgainc'] ?? false,
      numberOfCalories: json['numberOfCalories'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
    );
  }
}
