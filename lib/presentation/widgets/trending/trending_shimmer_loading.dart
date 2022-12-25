import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';

class TrendingShimmerLoading extends StatelessWidget {
  const TrendingShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(200, 200, 200, 1),
      highlightColor: const Color.fromRGBO(218, 218, 218, 1),
      child: ListView(
        padding:
            const EdgeInsets.only(right: 30, left: 30, bottom: 15, top: 120),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Trending', style: context.textTheme.headline1),
            ],
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: context.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight! * 0.58),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: context.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight! * 0.58),
          ),
        ],
      ),
    );
  }
}
