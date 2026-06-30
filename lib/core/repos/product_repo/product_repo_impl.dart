import 'package:dartz/dartz.dart';
import 'package:fruits/core/entitys/product_entity.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/core/models/product_model.dart';
import 'package:fruits/core/repos/product_repo/product_repo.dart';
import 'package:fruits/core/services/database_service.dart';
import 'package:fruits/core/utils/backend_endpoint.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndpoint.products,
        query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
      );
      List<ProductEntity> products = (data as List)
          .map(
            (e) => ProductModel.fromJson(e as Map<String, dynamic>).toEntity(),
          )
          .toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(path: BackendEndpoint.products);

      List<ProductEntity> products = (data as List)
          .map(
            (e) => ProductModel.fromJson(e as Map<String, dynamic>).toEntity(),
          )
          .toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
