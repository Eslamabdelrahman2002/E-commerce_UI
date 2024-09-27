import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "\$20",
                  style: myPrimaryTextStyle,
                ),
                Text(
                  "Dlivery fee",
                  style: mySecondaryTextStyle,
                )
              ],
            ),
            Column(
              children: [
                Text("15-30 min", style: myPrimaryTextStyle),
                Text("Dlivery Time", style: mySecondaryTextStyle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
