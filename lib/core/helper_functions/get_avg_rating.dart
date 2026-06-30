import 'package:fruits/core/entitys/reviews_entity.dart';

num getAvgRating(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) return 0;

  var sum = 0.0;
  for (var item in reviews) {
    sum += item.rating;
  }
  return sum / reviews.length;
}
