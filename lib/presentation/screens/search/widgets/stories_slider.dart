import 'package:diamonds/presentation/controllers/search_screen_controller.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoriesSlider extends StatelessWidget {
  const StoriesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchScreenController>(
      builder: (context, controller, child) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 59),
          child: Row(
            children: controller.isLoading
                ? [const SizedBox(width: 220, height: 340)]
                : List.generate(controller.imagesUrl.length, (int index) {
                    return Container(
                        width: 220,
                        height: 340,
                        margin: const EdgeInsets.only(right: 20),
                        child: FancyShimmerImage(
                          width: 220,
                          height: 340,
                          imageUrl: controller.imagesUrl[index],
                          shimmerBaseColor: Colors.grey.shade300,
                          shimmerHighlightColor: Colors.grey.shade100,
                          errorWidget: const Text("Error"),
                        ));
                  }),
          ),
        ),
      ),
    );
  }
}
