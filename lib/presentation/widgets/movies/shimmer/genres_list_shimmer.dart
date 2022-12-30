import 'package:flutter/material.dart';
import '../../shared/shimmer_item.dart';

class GenresListShimmer extends StatelessWidget {
  const GenresListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          itemBuilder: (BuildContext ctxt, int index) {
            return const ShimmerItem(width: 100, height: 40);
          }),
    );
  }
}
