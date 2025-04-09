import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopease/provider/AuthProvider.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final List<String> products = List.generate(10, (index) =>'https://storage.googleapis.com/a1aa/image/26784af0-8913-4599-b98f-ceb7c70106cf.jpeg');
  final List<IconData> categories = [Icons.add,Icons.remove,Icons.star, Icons.accessibility_sharp,
    Icons.add,Icons.remove,Icons.star,Icons.accessibility_sharp,Icons.add,Icons.remove,Icons.star,
    Icons.accessibility_sharp,];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.cyan,
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
              height: 100,
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              categories[index],
                              color: Colors.black,
                              size: 30,
                            ),
                          ),SizedBox(height: 1,),
                          Text('Category ${index + 1}'),
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
                crossAxisSpacing:8,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                  return Card(elevation: 3,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(products[index],fit: BoxFit.cover,)),);
                },
                childCount: products.length,
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        items: const<Widget>[
        Icon(Icons.add_shopping_cart,size: 30,),
        Icon(Icons.home,size: 30,),
        Icon(Icons.person,size: 30,)
      ],color: Colors.lightGreen,
        buttonBackgroundColor: Colors.white,backgroundColor: Colors.greenAccent,
        animationCurve: Curves.easeOut,animationDuration: Duration(milliseconds: 500),

      ),
    );
  }
}
