import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cast_card.dart';
import '../../../controllers/movie_details_provider.dart';

class CastList extends StatelessWidget {
  final Animation<Offset> animationOffset;

  const CastList({Key? key, required this.animationOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieDetailsProvider movieProvider =
        Provider.of<MovieDetailsProvider>(context);

    return SizedBox(
      height: 350,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemCount: movieProvider.cast?.cast?.length ?? 0,
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          itemBuilder: (BuildContext ctxt, int index) {
            return SlideTransition(
              // textDirection: context.isAr ? TextDirection.ltr : TextDirection.rtl,
              position: animationOffset,
              child: CastCard(
                cast: movieProvider.cast!.cast![index],
              ),
            );
          }),
    );
  }
}
