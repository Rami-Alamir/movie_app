import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/constants/fixed_assets.dart';

class TrendingButton extends StatelessWidget {
  const TrendingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Trending',
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [
                context.colorScheme.secondary,
                context.colorScheme.secondaryContainer,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.mirror),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Lottie.asset(
              FixedAssets.trending,
              width: 65,
              height: 65,
            ),
          ),
        ),
      ),
    );
  }
}
