import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../shared/shimmer_item.dart';
import '../movies/shimmer/movies_list_shimmer.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';

class MovieDetailsShimmerLoading extends StatelessWidget {
  const MovieDetailsShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(230, 230, 230, 1),
      highlightColor: const Color.fromRGBO(210, 210, 210, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ShimmerItem(
            width: SizeConfig.screenWidth!,
            height: SizeConfig.screenHeight! / 1.8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerItem(
                  width: SizeConfig.screenWidth! - 70,
                  height: 25,
                ),
                ShimmerItem(
                  width: SizeConfig.screenWidth! - 20,
                  height: 100,
                ),
                const ShimmerItem(
                  width: 100,
                  height: 30,
                ),
                const ShimmerItem(
                  width: 100,
                  height: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Cast',
              style: context.textTheme.headline1,
            ),
          ),
          const MoviesListShimmer(),
        ],
      ),
    );
  }
}
