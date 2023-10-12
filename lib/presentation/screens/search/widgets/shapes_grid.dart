import 'package:diamonds/presentation/controllers/search_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:diamonds/presentation/themes/app_theme.dart';
import 'package:provider/provider.dart';

class ShapesGrid extends StatefulWidget {
  const ShapesGrid({
    super.key,
  });

  @override
  State<ShapesGrid> createState() => _ShapesGridState();
}

class _ShapesGridState extends State<ShapesGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchScreenController>(
      builder: (context, controller, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: (150 / 70),
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          crossAxisCount: 3,
          children: List.generate(controller.categories.length, (index) {
            final isActive = controller.activeIndices.contains(index);

            return GestureDetector(
              onTap: () {
                controller.toggleActiveIndex(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                color: isActive ? AppTheme.buttonsActiveColor : Colors.white,
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        controller.icons[index],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      controller.categories[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
