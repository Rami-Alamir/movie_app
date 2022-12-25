import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'genres_item.dart';
import '../../../models/genres.dart';
import '../../../controllers/movies_provider.dart';

class GenresList extends StatelessWidget {
  const GenresList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);
    final List<Genres> genres = moviesProvider.genresList.genres!;
    return SizedBox(
      height: 65,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemCount: genres.length + 1,
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
          itemBuilder: (BuildContext ctxt, int index) {
            return GenresItem(
              id: index == 0 ? 0 : genres[index - 1].id!,
              name: index == 0 ? "All" : genres[index - 1].name!,
            );
          }),
    );
  }
}
