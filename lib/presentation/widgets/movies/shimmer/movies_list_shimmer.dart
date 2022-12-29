import 'package:flutter/material.dart';
import '../../shared/shimmer_item.dart';
import '../../../../core/utils/size_config.dart';

class MoviesListShimmer extends StatelessWidget {
  const MoviesListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          itemBuilder: (BuildContext ctxt, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerItem(
                  width: SizeConfig.setWidgetWidth(170, 200, 200),
                  height: SizeConfig.setWidgetHeight(230, 250, 250),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Column(
                    children: [
                      ShimmerItem(
                        width: SizeConfig.setWidgetWidth(165, 195, 195),
                        height: SizeConfig.setWidgetHeight(25, 25, 25),
                      ),
                      ShimmerItem(
                        width: SizeConfig.setWidgetWidth(165, 195, 195),
                        height: SizeConfig.setWidgetHeight(25, 25, 25),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
