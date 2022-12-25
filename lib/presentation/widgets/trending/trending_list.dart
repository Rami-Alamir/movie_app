import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../presentation/widgets/trending/trending_card.dart';
import '../../../controllers/trending_provider.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrendingProvider trendingProvider =
        Provider.of<TrendingProvider>(context);

    return ListView.builder(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        cacheExtent: 1000,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        itemCount: trendingProvider.trending!.movie!.length,
        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 15, top: 0),
        itemBuilder: (BuildContext ctxt, int index) {
          return TrendingCard(
            movie: trendingProvider.trending!.movie![index],
          );
        });
  }
}
