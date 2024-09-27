import 'package:flutter/material.dart';

import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          MyDrawerTile(
            text: "S H O P",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "C A R T",
            icon: Icons.shopping_cart,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart_page');
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyDrawerTile(
              text: "E X I T",
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
