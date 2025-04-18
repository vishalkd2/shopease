
import 'package:flutter/material.dart';
import 'package:shopease/models/ProductModel.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
   ProductDetails({super.key,required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.title.toString())),
    );
  }
}
