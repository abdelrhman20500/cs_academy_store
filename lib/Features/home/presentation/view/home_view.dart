import 'package:cs_academy_store/Features/home/presentation/view/widgets/custom_grid_product.dart';
import 'package:cs_academy_store/Features/home/presentation/view_manager/product_cubit.dart';
import 'package:cs_academy_store/Features/home/presentation/view_manager/product_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductCubit(Dio())..getProducts(),
        child: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {},
            builder: (context, state) {
              if(state is ProductFailure){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMessage),
                    backgroundColor: Colors.red,),);
              }else if(state is ProductSuccess){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomGridProduct(model:state.productModel),
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: Colors.deepPurple,),);
            },
        ),
      ),
    );
  }
}
