import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.onTap, this.child});

  final Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.secondary),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: child,
          )),
    );
  }
}
