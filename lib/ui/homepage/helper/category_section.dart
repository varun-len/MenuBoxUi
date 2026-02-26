import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodytest/framework/controllers/home_controller/home_controller.dart';

import 'category_helper.dart';

class CategorySection extends ConsumerStatefulWidget {
  final double width;
  const CategorySection({super.key, required this.width});

  @override
  ConsumerState<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends ConsumerState<CategorySection> {
  @override
  Widget build(BuildContext context) {
    final baseHomeController=ref.watch(homePageChangeNotifierProvider);
    return Column(
      children: [
        SizedBox(
          height: widget.width * 0.68,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: baseHomeController.modelCategory.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // square cells for balance
            ),
            itemBuilder: (context, index) {
              return CategoryHelper(index: index, width: widget.width);
            },
          ),
        ),
        SizedBox(height: 10),
      ],
    );

  }
}
