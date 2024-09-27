import 'package:flutter/material.dart';

class MyTapBar extends StatelessWidget {
  final TabController tabController;

  const MyTapBar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.settings),
          ),
          Tab(
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
