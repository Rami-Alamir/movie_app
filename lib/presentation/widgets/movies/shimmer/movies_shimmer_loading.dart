import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'genres_list_shimmer.dart';
import 'movies_list_shimmer.dart';
import 'now_playing_slider_shimmer.dart';
import '../../../../core/extensions/build_context_extensions.dart';

class MoviesShimmerLoading extends StatelessWidget {
  const MoviesShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(230, 230, 230, 1),
      highlightColor: const Color.fromRGBO(210, 210, 210, 1),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
              child: Text('Now Playing', style: context.textTheme.headline1),
            ),
            const NowPlayingSliderShimmer(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
              child: Text('Upcoming', style: context.textTheme.headline1),
            ),
            const MoviesListShimmer(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 10),
              child: Text('Movies', style: context.textTheme.headline1),
            ),
            const GenresListShimmer(),
            const MoviesListShimmer(),
          ],
        ),
      ),
    );
  }
}
