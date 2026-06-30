import 'package:bloc/bloc.dart';
import 'package:fruits/core/entitys/product_entity.dart';
import 'package:fruits/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;

  Future<void> getBestSellingProducts({String? id}) async {
    var result = await productRepo.getBestSellingProducts();
    emit(ProductsLoading());
    result.fold(
      (f) {
        emit(ProductsFailure(errMessage: f.errMessage));
      },
      (products) {
        emit(ProductsSuccess(products: products));
      },
    );
  }

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getProducts();

    result.fold(
      (f) {
        emit(ProductsFailure(errMessage: f.errMessage));
      },
      (products) {
        emit(ProductsSuccess(products: products));
      },
    );
  }
}
