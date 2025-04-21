import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopease/models/ProductModel.dart';
import 'package:shopease/widgets/CustomeWidgets.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title.toString()),
        automaticallyImplyLeading: false,
      ),
      body: ListView(padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          CarouselSlider(
              items: widget.product.images?.map((imageUrl) {
                    return Builder(builder: (BuildContext context) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(imageUrl: imageUrl.toString(),fit: BoxFit.fill,)
                      );
                    });
                  }).toList() ??
                  [],
              options: CarouselOptions(
                  height: 600,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 6),
                  viewportFraction: 1.0,
                  enlargeCenterPage: true)
          ),
          SizedBox(height: 10),
         Text("Name:   ${widget.product.title.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
         Divider(),
         Text("Description:   ${widget.product.description.toString()}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
          Divider(),
          Text("Category:   ${widget.product.category!.name.toString()}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
          Divider(),
          Text("Price:  ${widget.product.price.toString()}\$",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
          Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            CustomeWidgets.customeButtom(buttonName: "Cart"),
            CustomeWidgets.customeButtom(buttonName: "Buy"),
          ],),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
