import 'package:flutter/material.dart';
import 'package:shopease/models/CategoryModel.dart';
import 'package:shopease/models/ProductModel.dart';
import 'package:shopease/screen/ProductDetails.dart';
import 'package:shopease/services/ApiHelper.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<ProductModel> product = [];
  List<CategoryModel> categoryModel = [];
  bool isLoading = true;

  fetchCategory() {
    apiservices.getCatogery().then((value) {
      setState(() {
        categoryModel = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print("Error is: $error");
      setState(() {
        isLoading = false;
      });
    });
  }

  fetchPro() {
    apiservices.fetchProduct().then((value) {
      setState(() {
        product = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print("Error is:$error");
      setState(() {
        isLoading = false;
      });
    });
  }

  void initState() {
    fetchCategory();
    fetchPro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            automaticallyImplyLeading: false,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/sliverAppbar.jpg',
                  fit: BoxFit.fill,
                  // color: Colors.black.withOpacity(0.1),
                  colorBlendMode: BlendMode.darken),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.black54,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150,
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryModel.length,
                  itemBuilder: (context, index) {
                    final category = categoryModel[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                category.image.toString(),
                                height: 100,
                                fit: BoxFit.fill,
                              )),
                          SizedBox(height: 1),
                          Center(
                              child: Text(
                            category.name ?? '',
                            style: TextStyle(fontSize: 10),
                          ))
                        ],
                      ),
                    );
                  }),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>ProductDetails(product: product[index])));} ,
                    child: Card(
                        elevation: 3,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Image.network(
                                product[index].images![0].toString(),
                                fit: BoxFit.fill,
                              ),
                              Positioned.fill(
                                  top: 120,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    height: .5,
                                    color: Colors.black.withOpacity(.5),
                                    child: Center(
                                        child: Text(
                                      product[index].title ?? '',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ))
                            ],
                          ),
                        )),
                  );
                },
                childCount: product.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
