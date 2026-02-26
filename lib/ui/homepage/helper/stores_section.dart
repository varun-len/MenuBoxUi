import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';
import 'package:kodytest/ui/homepage/helper/recent_card.dart';

class StoresSection extends ConsumerStatefulWidget {
  const StoresSection({super.key});

  @override
  ConsumerState<StoresSection> createState() => _StoresSectionState();
}

class _StoresSectionState extends ConsumerState<StoresSection> {
  @override
  Widget build(BuildContext context) {
    final baseHomeController=ref.watch(homePageChangeNotifierProvider);
    return  SizedBox(
      height: 120, // give fixed height for horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: baseHomeController.stores?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RecentCard(index: index),
          );
        },
      ),
    );
  }
}
