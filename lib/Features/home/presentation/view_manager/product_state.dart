import 'package:cs_academy_store/Features/home/data/model/product_model.dart';

abstract class ProductState{}
class ProductInitial extends ProductState{}
class ProductLoading extends ProductState{}
class ProductFailure extends ProductState{
  final String errMessage;
  ProductFailure({required this.errMessage});
}
class ProductSuccess extends ProductState{
  final List<ProductModel> productModel;
  ProductSuccess({required this.productModel});
}

