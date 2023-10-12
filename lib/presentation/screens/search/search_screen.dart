import 'package:diamonds/presentation/screens/search/widgets/bottom_bar.dart';
import 'package:diamonds/presentation/screens/search/widgets/search_appbar.dart';
import 'package:diamonds/presentation/screens/search/widgets/shapes_grid.dart';
import 'package:diamonds/presentation/screens/search/widgets/sharp_edge_button.dart';
import 'package:diamonds/presentation/screens/search/widgets/stories_slider.dart';
import 'package:diamonds/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppTheme.secondaryColor,
            appBar: const SearchAppbar(),
            body: ListView(children: [
              const StoriesSlider(),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "SEARCH",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SharpEdgeButton(
                        text: "Clear",
                        isSelect: false,
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Lot #',
                    hintStyle: TextStyle(color: AppTheme.textFieldHint),
                  ),
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 39),
                padding: const EdgeInsets.only(left: 24, top: 12, bottom: 12),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shapes".toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SharpEdgeButton(
                      text: "Select All",
                      isSelect: true,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const ShapesGrid(),
              const SizedBox(
                height: 3,
              ),
              const BottomBar()
            ])));
  }
}
