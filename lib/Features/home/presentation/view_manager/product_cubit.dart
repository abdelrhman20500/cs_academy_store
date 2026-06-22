import 'package:cs_academy_store/Features/home/data/model/product_model.dart';
import 'package:cs_academy_store/Features/home/presentation/view_manager/product_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.dio) : super(ProductInitial());
  final Dio dio;

  Future<void> getProducts() async {
    emit(ProductLoading());
    try {
      final response = await dio.get("https://dummyjson.com/products");
      List<dynamic> productList = response.data['products'];
      final products = productList.map((e) => ProductModel.fromJson(e)).toList();
      print(products);
      emit(ProductSuccess(productModel: products)); // حالة نجاح مع البيانات
    } catch (e) {
      emit(ProductFailure(errMessage: e.toString()));
    }
  }
}
