import 'package:flutter/material.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';

class RecentCard extends StatelessWidget {
  final int index;
  const RecentCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 70,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // rounded corners
          ),
          child: Image.network(
            HomePageController.stores?[index].image ?? '',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          HomePageController.stores?[index].name ?? '',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis, // prevent text overflow
        ),
      ],
    );
  }
}
