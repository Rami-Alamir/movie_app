import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/favorites_provider.dart';
import '../../../models/movie.dart';

class FavoriteIcon extends StatelessWidget {
  final Movie movie;
  const FavoriteIcon({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context);
    final bool isFavorite = favoritesProvider.isFavorite(movie.id!);
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite_outlined : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.white,
        size: 25,
      ),
      onPressed: () {
        isFavorite
            ? favoritesProvider.removeFromFavorite(movie)
            : favoritesProvider.addToFavorite(movie);
      },
    );
  }
}
