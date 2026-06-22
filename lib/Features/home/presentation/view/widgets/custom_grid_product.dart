import 'package:cs_academy_store/Features/home/data/model/product_model.dart';
import 'package:cs_academy_store/Features/home/presentation/view/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';


class CustomGridProduct extends StatelessWidget {
  const CustomGridProduct({super.key, required this.model});

  final List<ProductModel> model;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2.2/ 4.0,
      ),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return CustomProductItem(
          id: model[index].id!,
          name: model[index].title!,
          image: model[index].images![0],
          description: model[index].description!,
          price: model[index].price!.toDouble(),
          rating: model[index].rating!.toDouble(),
        );
      },
    );
  }
}
