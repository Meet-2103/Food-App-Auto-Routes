import 'package:flutter/material.dart';

class HomeScreenTabs extends StatelessWidget {
  final String name;
  const HomeScreenTabs({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        child: Text(name),
      ),
    );
  }
}
