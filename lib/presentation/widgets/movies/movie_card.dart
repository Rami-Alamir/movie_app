import 'package:flutter/material.dart';
import '../shared/movie_poster.dart';
import '../../../models/movie.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/constants/route_constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isUpcoming;
  const MovieCard({Key? key, required this.movie, this.isUpcoming = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(routName: movieDetails, arguments: movie.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            MoviePoster(
              movie: movie,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: SizeConfig.setWidgetWidth(150, 200, 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originalTitle!,
                      style: context.textTheme.headline3,
                      maxLines: 3,
                    ),
                    Row(
                      children: [
                        Text(isUpcoming ? movie.releaseDate! : 'Rate: ',
                            style: context.textTheme.headline6!
                                .copyWith(height: 2)),
                        Text(isUpcoming ? '' : "${movie.voteAverage!}",
                            style: context.textTheme.headline3!
                                .copyWith(height: 2, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
