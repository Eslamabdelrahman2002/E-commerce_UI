import 'package:ecommerce_app/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Minimal Shopping",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Premium Quality Products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
