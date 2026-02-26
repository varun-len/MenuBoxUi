import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';

class CategoryHelper extends ConsumerWidget {
  final int index;
  final double width;
  const CategoryHelper({super.key, required this.index, required this.width});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final baseHomeController=ref.watch(homePageChangeNotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            baseHomeController.modelCategory[index].image ?? '',
            fit: BoxFit.cover, // ensures proper fitting
            width: width*0.22,
            height: width*0.22,
          ),
        ),
        SizedBox(height: 3),
        Text(
          baseHomeController.modelCategory[index].name ?? '',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
