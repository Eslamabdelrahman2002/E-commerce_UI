import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // Updated builder syntax
        content: Text('Add this item to your cart?'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product); // Corrected method
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                width: double.infinity,
                padding: EdgeInsets.all(25),
                child: Image.asset(product.imagePath),
              ),
            ),
            SizedBox(height: 25),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.price.toStringAsFixed(2)),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => addToCart(context),
                    // Corrected method call
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
