import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFormCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // Updated builder syntax
        content: Text('remove this item from your cart?'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product); // Corrected method
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  void PayButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  'User want\'s to pay! Connect this app to your payment backend'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text("Cart Page")),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Center(
                      child: Text("Your Cart is Empty..."),
                    )
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => removeItemFormCart(context, item),
                          ),
                        );
                      })),
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
              onTap: () => PayButtonPressed,
              child: Text('Pay Now'),
            ),
          )
        ],
      ),
    );
  }
}
