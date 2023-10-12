import 'package:diamonds/presentation/controllers/search_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:diamonds/presentation/ui_kit/icons.dart';
import 'package:provider/provider.dart';

class SharpEdgeButton extends StatelessWidget {
  const SharpEdgeButton({super.key, required this.text, required this.isSelect});
  final String text;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<SearchScreenController>(context, listen: false).toggleAll();
      },
      child: Stack(children: [
        SizedBox(
          width: 80,
          height: 40,
          child: SvgPicture.asset(
            isSelect ? SvgAssets.iconButtonClippedNoBorder : SvgAssets.iconButtonClipped,
          ),
        ),
        Positioned(
            bottom: 12,
            right: isSelect ? 8 : 23,
            child: Text(
              text,
              style: Theme.of(context).textTheme.displaySmall,
            ))
      ]),
    );
  }
}
