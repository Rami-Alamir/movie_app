import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_card.dart';
import '../../../core/enum/device_screen_type.dart';
import '../../../core/utils/size_config.dart';
import '../../../models/movie.dart';
import '../../../controllers/movies_provider.dart';

class MoviesList extends StatefulWidget {
  final bool isUpcoming;
  final ScrollController controller;
  const MoviesList(
      {Key? key, this.isUpcoming = false, required this.controller})
      : super(key: key);

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);
    final List<Movie> movies = widget.isUpcoming
        ? moviesProvider.upcoming!.movie!
        : moviesProvider.movies!.movie!;
    return SizedBox(
      height:
          SizeConfig.deviceScreenType == DeviceScreenType.mobile ? 355 : 375,
      child: ListView.builder(
          controller: widget.controller,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemCount: movies.length,
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          itemBuilder: (BuildContext ctxt, int index) {
            return MovieCard(
              isUpcoming: widget.isUpcoming,
              movie: movies[index],
            );
          }),
    );
  }
}
