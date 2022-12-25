import 'package:flutter/material.dart';
import '../shared/movie_poster.dart';
import '../../../models/movie.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/constants/route_constants.dart';

class FavoriteCard extends StatelessWidget {
  final Movie movie;
  final double width;
  const FavoriteCard({Key? key, required this.movie, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(routName: movieDetails, arguments: movie.id),
      child: Row(
        children: [
          MoviePoster(
            movie: movie,
            width: width,
          ),
        ],
      ),
    );
  }
}
