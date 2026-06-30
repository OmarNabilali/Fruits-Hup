import 'package:dartz/dartz.dart';
import 'package:fruits/core/entitys/product_entity.dart';
import 'package:fruits/core/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
