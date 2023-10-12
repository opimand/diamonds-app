import 'package:diamonds/presentation/controllers/search_screen_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:diamonds/presentation/themes/app_theme.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double halfScreenWidth = screenWidth / 2;

    return Stack(
      children: [
        Row(
          children: [
            Expanded(
                child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<SearchScreenController>(context, listen: false).saveToHive();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saved, try to close the app 🎉')));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  side: BorderSide.none,
                ),
                child: Text(
                  'Save & Search'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
            )),
            Expanded(
                child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Searching ... 🔎')));
                  if (kDebugMode) {
                    print("Searching... 🔎");
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  side: BorderSide.none,
                ),
                child: Text(
                  'Search'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
            )),
          ],
        ),
        Positioned(
            right: halfScreenWidth,
            bottom: 10,
            child: Container(
              width: 2,
              height: 30,
              color: AppTheme.buttonsColor,
            )),
      ],
    );
  }
}
