import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text("Shop Page")),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart_page');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(children: [
        SizedBox(
          height: 25,
        ),
        Center(
          child: Text(
            "Pick from a select list of premium product",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        SizedBox(
          height: 550,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final Product = Products[index];
              return MyProductTile(product: Product);
            },
            itemCount: Products.length,
          ),
        ),
      ]),
    );
  }
}
