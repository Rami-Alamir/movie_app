import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/shared/shimmer_item.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';

class TrendingShimmerLoading extends StatelessWidget {
  const TrendingShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(230, 230, 230, 1),
      highlightColor: const Color.fromRGBO(210, 210, 210, 1),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding:
            const EdgeInsets.only(right: 30, left: 30, bottom: 15, top: 120),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Trending', style: context.textTheme.headline1),
            ],
          ),
          ShimmerItem(
            width: SizeConfig.screenWidth!,
            height: SizeConfig.setWidgetHeight(
                SizeConfig.screenHeight! * 0.58,
                SizeConfig.screenHeight! * 0.72,
                SizeConfig.screenHeight! * 0.72),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: ShimmerItem(
              width: SizeConfig.screenWidth!,
              height: SizeConfig.setWidgetHeight(
                  SizeConfig.screenHeight! * 0.58,
                  SizeConfig.screenHeight! * 0.72,
                  SizeConfig.screenHeight! * 0.72),
            ),
          ),
        ],
      ),
    );
  }
}
