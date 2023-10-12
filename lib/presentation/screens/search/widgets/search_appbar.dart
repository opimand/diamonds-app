import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:diamonds/presentation/ui_kit/icons.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        leading: SizedBox(
          width: 56.30,
          height: 46.37,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: SvgPicture.asset(
              SvgAssets.iconMenu,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ),
        actions: [
          SizedBox(
            width: 34,
            height: 34,
            child: IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: SvgPicture.asset(
                SvgAssets.iconSearch,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
